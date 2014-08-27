import XMonad  
import XMonad.Config.Azerty  
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  
import XMonad.Util.Run(spawnPipe)  
import XMonad.Util.EZConfig  
import Graphics.X11.ExtraTypes.XF86  
import XMonad.Layout.Spacing  
import XMonad.Layout.NoBorders(smartBorders)  
import XMonad.Layout.PerWorkspace  
import XMonad.Layout.IM  
import XMonad.Layout.Grid  
--import XMonad.Actions.GridSelect  
import Data.Ratio ((%))  
import XMonad.Actions.CycleWS  
import qualified XMonad.StackSet as W  
import System.IO  


myTerminal      = "xterm -bg black -fg green -fn *-fixed-*-*-*-12-*"

myWorkspaces  = ["1:Main","2:Xat","3:Web","4:Music","5:Video","6", "7", "8", "9"]  

myModMask       = mod4Mask

myLayout = onWorkspace "2:Xat" pidginLayout $ onWorkspace "5:Video" nobordersLayout $ tiled1 ||| Mirror tiled1 ||| nobordersLayout  
 where  
  tiled1 = spacing 5 $ Tall nmaster1 delta ratio  
  --tiled2 = spacing 5 $ Tall nmaster2 delta ratio  
  nmaster1 = 1  
  nmaster2 = 2  
  ratio = 2/3  
  delta = 3/100  
  nobordersLayout = smartBorders $ Full  
  gridLayout = spacing 8 $ Grid       
  --gimpLayout = withIM (0.20) (Role "gimp-toolbox") $ reflectHoriz $ withIM (0.20) (Role "gimp-dock") Full  
  pidginLayout = withIM (18/100) (Role "buddy_list") gridLayout  

myManageHook = composeAll       
     [ className =? "File Operation Progress"   --> doFloat  
     , resource =? "desktop_window" --> doIgnore  
     , className =? "xfce4-notifyd" --> doIgnore  
     , className =? "Pidgin" --> doShift "2:Xat"  
     , title =? "New Tab - Google Chrome" --> doShift "3:Web"
     , className =? "Firefox" --> doShift "3:Web"
     , className =? "Clementine" --> doShift "4:Music"  
     , className =? "Vlc" --> doShift "5:Video"  
     ]  

main = do  
  xmproc <- spawnPipe "/usr/bin/xmobar /home/maitesin/.xmobarrc"  
  --spawn "xcompmgr -Cf"  
  xmonad $ azertyConfig  
    { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above  
            <+> manageHook defaultConfig  
    , layoutHook = avoidStruts $ myLayout  
    , logHook = dynamicLogWithPP xmobarPP  
            { ppOutput = hPutStrLn xmproc  
            , ppTitle = xmobarColor "#2CE3FF" "" . shorten 50  
               , ppLayout = const "" -- to disable the layout info on xmobar  
            }  
    , modMask = mod4Mask  
     , workspaces     = myWorkspaces  
    , normalBorderColor = "#60A1AD"  
    , focusedBorderColor = "#68e862"  
     , borderWidth    = 2
     , terminal = myTerminal  
    }`additionalKeys`  
     [ ((controlMask, xK_space), spawn "exe=`dmenu_run -b -nb black -nf yellow -sf yellow` && eval \"exec $exe\"") -- spawn dmenu  
    
    ------------------ 
    -- Window Managing
    ------------------
    -- Move focus to the next window	
    , ((mod4Mask, xK_j), windows W.focusDown)
    -- Move focus to the previous window
    , ((mod4Mask, xK_k), windows W.focusUp)
    -- Move focus to the master window
    , ((mod4Mask, xK_m), windows W.focusMaster)
    -- Swap the focused window and the master window
    , ((mod4Mask, xK_Return), windows W.swapMaster)
    -- Swap the focused windows with the next window
    , ((mod4Mask .|. shiftMask, xK_j), windows W.swapDown)
    -- Swap the focused windows with the previos window
    , ((mod4Mask .|. shiftMask, xK_k), windows W.swapUp)
    -- Shrink the master area
    , ((mod4Mask, xK_h), sendMessage Shrink)
    -- Expand the master area
    , ((mod4Mask, xK_l), sendMessage Expand)

    -------
    -- Apps
    -------
    -- Google Chrome
    , ((mod4Mask, xK_g), spawn "google-chrome-stable")
    -- Pidgin
    , ((mod4Mask .|. shiftMask, xK_p), spawn "pidgin")
    -- VirtualBox
    , ((mod4Mask, xK_v), spawn "VirtualBox")
    -- Clementine
    , ((mod4Mask, xK_c), spawn "clementine")
    -- VLC
    , ((mod4Mask .|. shiftMask, xK_v ), spawn "vlc")
    -- Terminator
    , ((mod4Mask, xK_Return), spawn "terminator") -- spawn terminator terminal  
    -- Thunar
    , ((mod4Mask, xK_t), spawn "thunar")  
    -- Dmenu
    , ((mod4Mask, xK_p), spawn "dmenu_run")
    -- Kill the focused app
    , ((mod4Mask .|. shiftMask, xK_c), kill) -- kill the app

    -----------------------------
    -- Volumen and music controls
    -----------------------------
     , ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 3%-") -- decrease volume  
     , ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 3%+") -- increase volume  
     , ((mod4Mask .|. shiftMask, xK_l), spawn "slimlock")  
     , ((0, xF86XK_AudioMute), spawn "amixer set Master toggle") -- mute volume  
    , ((controlMask .|. shiftMask, xK_Right), spawn "ncmpcpp next") -- play next song in mpd  
    , ((controlMask .|. shiftMask, xK_Left), spawn "ncmpcpp prev") -- play previous song  


     --, ((mod4Mask, xK_a ), windows W.swapUp) -- swap up window  
     --, ((mod4Mask, xK_z ), windows W.swapDown) -- swap down window  
     --, ((mod4Mask, xK_KP_Add ), sendMessage (IncMasterN 1)) -- increase the number of window on master pane  
     --, ((mod4Mask, xK_KP_Subtract ), sendMessage (IncMasterN (-1))) -- decrease the number of window  
     --, ((controlMask,        xK_Right   ), sendMessage Expand) -- expand master pane  
     --, ((controlMask,        xK_Left   ), sendMessage Shrink) -- shrink master pane  
     --, ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s") -- capture screenshot of focused window       
    --, ((0, xK_Print), spawn "scrot") -- capture screenshot of full desktop  
     --, ((0, xF86XK_HomePage), spawn "iron") -- run iron  
     --, ((mod4Mask, xK_p), spawn "/home/lulz/scripts/pidgin.open")  
     ]`removeKeys`     -- keys to remove  
     [ --(mod4Mask .|. shiftMask, xK_c)  
     -- (mod4Mask .|. shiftMask, xK_j)  
     -- (mod4Mask .|. shiftMask, xK_k)  
     -- (mod4Mask, xK_j)  
     -- (mod4Mask, xK_k)  
     -- (mod4Mask, xK_h)  
     -- (mod4Mask, xK_l)  
     (mod4Mask, xK_comma)  
     , (mod4Mask, xK_period)  
     ]`additionalMouseBindings`  
     [--((mod4Mask, button4),\_-> nextWS)  
     --,((mod4Mask, button5),\_-> prevWS)  
     ((mod4Mask, button4),\_-> spawn "amixer set Master 3%+")  
     ,((mod4Mask, button5),\_-> spawn "amixer set Master 3%-")  
     ,((mod4Mask, button3),\_-> return())  
     ,((mod4Mask, button1),\_-> return())  
     ]  
