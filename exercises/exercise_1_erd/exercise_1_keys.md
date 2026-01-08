## 3. Identify keys

| EmployeeID | Förnamn | Efternamn | AvdelningID | E-post                       | Telefon     |
| ---------- | ------- | --------- | ----------- | ---------------------------- | ----------- |
| 201        | Erik    | Johansson | 1           | erik.johansson@coolfirma.se  | 070-1234567 |
| 202        | Anna    | Karlsson  | 2           | anna.karlsson@coolfirma.se   | 073-2345678 |
| 203        | Johan   | Andersson | 1           | johan.andersson@coolfirma.se | 072-3456789 |
| 204        | Sara    | Lindgren  | 3           | sara.lindgren@coolfirma.se   | 076-4567890 |
| 205        | Maria   | Svensson  | 2           | maria.svensson@coolfirma.se  | 070-5678901 |


### a) Which columns could be candidate keys here?
- A candidate key is a column (or a set of columns) that can uniquely identify every row in the table without any duplicates.
`EmployeeID`

### b) From this set of candidate keys, which one would you choose as primary key and which ones as alternate keys?
- Primary Key (PK): `EmployeeID`. This is the most stable choice as it is short, numeric, and designed specifically for identification.

- Alternate Keys: `E-post` and `Telefon`. These are unique identifiers that were not chosen as the primary key.

### c) Is your primary key considered as natural key or surrogate key?
- `Natural Key` - A key formed from real-world, meaningful data (ISBN, email)
- `Surrogate Key` - A system generated key with no real world business meaning (IDs)
- `EmployeeID` is the **Surrogate Key**: an artificial identifier (usually a number) generated internally by the system solely for the purpose of uniquely identifying a record.

### d) Create another table with a primary key where one of the columns in this table could act as a foreign key. For instance, you can create a table with more information about each avdelning. 
- To link these tables, we can create an `Avdelningar` (Departments) table. The `AvdelningID` column in original table would act as the Foreign Key pointing to this new table.

```bash
AvdelningID (PK),Avdelningsnamn,Ort
1,IT,Stockholm
2,Marknad,Göteborg
3,HR,Malmö
```

### SQL Implementation
- This code creates the "parent" table first (Departments) and then the "child" table (Employees) that links back to it using the Foreign Key.
```sql
-- 1. Create the Departments table
CREATE TABLE Avdelningar (
    AvdelningID INT PRIMARY KEY,
    Avdelningsnamn VARCHAR NOT NULL,
    Ort VARCHAR
);

-- 2. Create the Employees table with a Foreign Key
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY, -- Surrogate Primary Key
    Förnamn VARCHAR,
    Efternamn VARCHAR,
    E_post VARCHAR UNIQUE, -- Alternate Key
    Telefon VARCHAR UNIQUE, -- Alternate Key
    AvdelningID INT,
    FOREIGN KEY (AvdelningID) REFERENCES Avdelningar(AvdelningID)
);
```