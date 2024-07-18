# Interview Preparation Material

## S.O.L.I.D.
The S.O.L.I.D. principles are a set of design guidelines that help developers write more maintainable, scalable, and testable code. S.O.L.I.D. stands for: Single Responsability, Open-Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion.

### S - Single Responsability Principle
SRP dictates that a struct/package should focus on a single well-defined area of functionality. Imagine each strcut as a specialist with a specific expertice. This keeps your code organized and reduces complexity.

Instead of:
```
package survey

type Survey struct {
	Title string
	Questions []string
}

func (s *Survey) GetTitle() string {
	return s.Title
}

func (s *Survey) Validate() bool {
	return len(s.Questions) > 0
}

func (s *Survey) Save() error {
	// saves the survey to the database
	return nil
}
```

We should do:
```
package survey

type Survey struct {
	Title     string
	Questions []string
}

func (s *Survey) GetTitle() string {
	return s.Title
}

func (s *Survey) Validate() bool {
	return len(s.Questions) > 0
}

type Repository interface {
	Save(survey *Survey) error
}

// One of many possible implementations
type InMemoryRepository struct {
	surveys []*Survey
}

func (r *InMemoryRepository) Save(survey *Survey) error {
	r.surveys = append(r.surveys, survey)
	return nil
}

func SaveSurvey(survey *Survey, repo Repository) error {
	return repo.Save(survey)
}
```

### O - Open-Closed Principle
OCP is a cornerstone of good software design. It dictates that software entities (classes, modules, functions, and the like) should be designed with future growth in mind. This means they should be open for extension, allowing for the addition of new features and functionalities, while remaining closed for modification. Modifying existing code to accommodate new needs is risky, as it can introduce bugs and make future maintenance a nightmare.

Instead of:
```
package survey

// ...

func ExportSurvey(s *Survey, dst string) error {
	switch dst {
	case "s3":
		// export to s3
		return nil
	case "gcs":
		// export to gcs
		return nil
	default:
		return nil
	}
}
```

We should do:
```
package survey

// ...

type Exporter interface {
	Export(survey *Survey) error
}

type S3Exporter struct{}

func (e *S3Exporter) Export(survey *Survey) error {
	return nil
}

type GCSExporter struct{}

func (e *GCSExporter) Export(survey *Survey) error {
	return nil
}

func ExportSurvey(s *Survey, exporter Exporter) error {
	return exporter.Export(s)
}
```

### L - Liskov Substitution Principle
LSP ensure objects can be swapped without breaking the program. While Go lacks traditional inheritance, interfaces achieve this. Any type can "implement" an interface simply by having methods that match its signature. This promotes flexibility - code using the interface can work with varios types as long as the fulfill the contract.

```
type Writer interface {
        Write(buf []byte) (n int, err error)
}
```

```
func WriteSurvey(s *Survey, writer io.Writer) (int, error) {
	b, err := json.Marshal(s)
	if err != nil {
		return 0, err
	}

	return writer.Write(b)
}
```

```
file, err := os.Open("file.go")
if err != nil {
	log.Fatal(err)
}

survey := &Survey{Title: "Feedback Form"}
WriteSurvey(&Survey, file)
```

### I - Interface Segregation Principle
ISP states that clients should not be forced to depend on interfaces they do not use. This principle encourages creating smaller, more focues interfaces rather than large, monilithic ones.

Instead of:
```
type Question interface {
	SetTitle()
	AddOption()
}

type TextQuestion struct {
	Title string
}

func (q *TextQuestion) SetTitle(title string) {
	q.Title = title
}

func (q *TextQuestion) AddOption(option string) {
	// not supported as text fields don't have options
}

type DropdownQuestion struct {
	Title   string
	Options []string
}

func (q *DropdownQuestion) SetTitle(title string) {
	q.Title = title
}

func (q *DropdownQuestion) AddOption(option string) {
	q.Options = append(q.Options, option)
}
```

We should do:
```
type Question interface {
	SetTitle()
}

type QuestionWithOptions interface {
	Question
	AddOption()
}

type TextQuestion struct {
	Title string
}

func (q *TextQuestion) SetTitle(title string) {
	q.Title = title
}

type DropdownQuestion struct {
	Title   string
	Options []string
}

func (q *DropdownQuestion) SetTitle(title string) {
	q.Title = title
}

func (q *DropdownQuestion) AddOption(option string) {
	q.Options = append(q.Options, option)
}
```

### D - Dependency Inversion Principle
DIP states that high-level modules should not depend on low-level modules. Both should depend on abstractions.

Instead of:
```
type InMemoryRepository struct {
	surveys []*Survey
}

type SurveyManager struct {
	store InMemoryRepository
}

func NewSurveyManager() *SurveyManager {
	return &SurveyManager{
		store: InMemoryRepository{},
	}
}

func (m *SurveyManager) Save(survey *Survey) error {
	return m.store.Save(survey)
}
```

We should do:
```
type Repository interface {
	Save(survey *Survey) error
}

type SurveyManager struct {
	store Repository
}

func NewSurveyManager(store Repository) *SurveyManager {
	return &SurveyManager{
		store: store,
	}
}

func (m *SurveyManager) Save(survey *Survey) error {
	return m.store.Save(survey)
}
```

## ACID
ACID stands for **Atomicity**, **Consistency**, **Isolation**, and **Durability**.

* **Atomicity**: The operations that constitute the transaction will either all succeed or all fail. There is no in-between state.
* **Consistency**: The transaction cannot bring the database to an invalid state. After the transaction is committed or rolled back, the rules for each record will still apply, and all future transactions will see the effect of the transaction. Also named **Strong Consistency**.
* **Isolation**: The execution of multiple transactions concurrently will have the same effect as if they had been executed sequentially.
* **Durability**: Any committed transaction is written to non-volatile storage. It will not be undone by a crash, power loss, or network partition.

## CAP Theorem
The CAP Theorem states that systems can only have two out of these three characteristics, but not all three at the same time.

* Consistency
* Availability
* Partition Tolerance

## Load Balancers
The most basic load balancer could be done with a simple Nginx instance. But one of the most important parts of the load balancer would be the policy it applies to decide which one of the servers gets used by each user.

* Random
* Round-Robbin
* Weighted Round-Robbin
* Hashing
* Consistent Hashing
* Rendezvous Hashing

## Key-Value Stores
* Etcd: is a strongly consistent and highly available key-value store that's often used to implement leader election in a system.
* Redis: an in-memory key-value store. Does offer some persistent storage options but is typically used as a really fast, best-effort caching solution. Redis is also often used to implement **rate limiting**.
* ZooKeeper: is a strongly consisitent, highly available key-value store. It's often used to store important configuration or to perform leader election.

## Blob Stores
Used to store large binaries, database snapshots, or images and other static assets that a website might have.

* GCS: 
* S3: 

## Time Series
Is a DB that specialize in storing time-indexed data. Tipically used for monitoring, IoT (telemetry, sensors), or stock prices.
* InfluxDB:
* Prometheus:
* Graphite:

## Graph Database
Neo4j:

