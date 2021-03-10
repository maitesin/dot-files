---
title: Unexpected beviours
created: '2020-10-01T09:10:19.019Z'
modified: '2021-03-10T13:25:55.718Z'
---

# Unexpected beviours

## C++ remove element when iterating

```
#include<iostream>
#include<vector>

int main(void) {
        auto vec = std::vector<int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

        for (auto it = std::begin(vec); it != std::end(vec); it++) {
                if (*it == 4) {
                        vec.erase(it);
                }
        }

        for (auto x : vec) {
                std::cout << "Value: " << x << std::endl;
        }

        return 0;
}
```

```
#include<iostream>
#include<vector>

int main(void) {
        auto vec = std::vector<int>{0, 1, 2, 3, 4, 4, 5};

        for (auto it = std::begin(vec); it != std::end(vec); it++) {
                if (*it == 4) {
                        vec.erase(it);
                }
        }

        for (auto x : vec) {
                std::cout << "Value: " << x << std::endl;
        }

        return 0;
}
```

```
#include<iostream>
#include<vector>
#include<algorithm>

int main(void) {
        auto vec = std::vector<int>{0, 1, 2, 3, 4, 4, 5};

        vec.erase(
                std::remove_if(
                        std::begin(vec),
                        std::end(vec),
                        [](int v){ return v == 4; }
                        ),
                std::end(vec)
                );

        for (auto x : vec) {
                std::cout << "Value: " << x << std::endl;
        }

        return 0;
}
```


## C++ check if an element is in the map using map[id] instead of map.get(id)

## C what is the result of doing ++a + a++ + ++a (https://en.wikipedia.org/wiki/Sequence_point)
```
#include<stdio.h>

int main(void) {
        int a, b;
        a = 0;
        b = ++a + a++ + ++a;
        printf("%d\n", b);
        return 0;
}
```

## Python changes the order of the letters in constants when

## Python compare large floats:https://twitter.com/raymondh/status/1316882357995986945?s=20

## Python floats are broken
```
>>> i
0.7
>>> j
0.8
>>> j - i
0.10000000000000009
```

## Python has two zeros for floats: https://twitter.com/raymondh/status/1316882360260988928?s=20 

## Java compare Integers

## Java insert integer into list of strings

## Go
The order matters
https://stackoverflow.com/a/46290179
