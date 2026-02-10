# My OLTP Data Modelling Journey: Part 1 - Foundations

## Chapters 1-2: Introduction to Data Modelling and Database Types

---

### 👋 Welcome to My Learning Journey!

Hey there! If you're reading this, you're probably curious about data modeling or maybe just starting your journey as a data engineer like me. I want to share what I've learned about data modeling and database types - concepts that seemed intimidating at first but turned out to be absolutely fundamental to everything we do in data engineering.

Let's dive in together!

---

## Chapter 1: What is Data Modelling and Why Should You Care?

### The "Aha!" Moment

When I first heard the term "data modeling," I thought it was just about drawing fancy diagrams. Boy, was I wrong! Data modeling is actually **the unsung hero of data engineering** (yes, I borrowed that phrase from an [excellent Airbyte article](https://airbyte.com/blog/data-modeling-unsung-hero-data-engineering-introduction), and it stuck with me).

### So, What Exactly IS Data Modelling?

In simple terms, **data modeling is the process of creating a blueprint for how data will be stored, organized, and accessed in a database**. 

Think of it like designing a house before building it:
- You wouldn't just start throwing bricks together and hope for the best, right?
- You'd create a blueprint showing where rooms go, how they connect, and what purpose each serves
- Data modeling does the same thing, but for your data!

According to [AWS](https://aws.amazon.com/what-is/data-modeling/), data modeling creates a visual representation of an information system and the connections between different data points.

### Why Does It Matter?

Here's where it gets interesting. Without proper data modeling, you run into some serious problems:

#### 1. **Data Redundancy** 😱
Imagine storing the same customer's address in 10 different tables. Now imagine updating that address... in 10 places... and missing one. Chaos!

[GeeksforGeeks explains](https://www.geeksforgeeks.org/dbms/the-problem-of-redundancy-in-database/) that redundancy leads to:
- Wasted storage space
- Data inconsistency (when updates don't happen everywhere)
- Confusion and errors

#### 2. **Data Integrity Issues** 🔒
Good data modeling ensures your data stays accurate and consistent. It prevents situations like:
- Orders without customers
- Products with negative prices
- Duplicate records where there should only be one

#### 3. **Scalability Nightmares** 📈
A poorly designed database might work fine with 100 records. But what about 1 million? 100 million? Proper data modeling sets you up for success from day one.

### Real-World Impact

As a data engineer, you'll spend a significant amount of time ensuring data is:
- **Clean** - No duplicates or errors
- **Consistent** - Same rules everywhere
- **Accessible** - Easy to query and retrieve
- **Scalable** - Can grow with your business

Good data modeling makes all of this possible. Bad data modeling makes all of this a nightmare.

---

## Chapter 2: Understanding Database Types

Now that we know *why* data modeling matters, let's talk about the different types of databases we can model for. This was eye-opening for me because I realized there's no "one size fits all" solution!

### The Big Picture: Three Types of Data

Before we talk about databases, we need to understand the types of data they store:

#### 1. **Structured Data** 📊

This is data that fits neatly into rows and columns, like a spreadsheet.

**Example:**
```
| customer_id | name          | email                  | signup_date |
|-------------|---------------|------------------------|-------------|
| 1           | Alice Smith   | alice@email.com        | 2024-01-15  |
| 2           | Bob Johnson   | bob@email.com          | 2024-01-16  |
```

**Characteristics:**
- Highly organized and easy to search
- Follows a strict schema (predefined structure)
- Perfect for traditional databases

**When to use:** Customer records, financial transactions, inventory systems

#### 2. **Unstructured Data** 📝

This is data that doesn't fit into a neat table structure.

**Examples:**
- Email messages
- Social media posts
- Images and videos
- PDF documents
- Audio files

**Characteristics:**
- No predefined schema
- Harder to search and analyze
- Requires different storage and processing approaches

**When to use:** Document storage, media libraries, social media platforms

#### 3. **Semi-Structured Data** 🎯

This is the middle ground - it has some structure but not as rigid as structured data.

**Examples:**
- JSON files
- XML documents
- Log files

**Example JSON:**
```json
{
  "customer_id": 1,
  "name": "Alice Smith",
  "orders": [
    {"order_id": 101, "amount": 50.00},
    {"order_id": 102, "amount": 75.50}
  ],
  "preferences": {
    "newsletter": true,
    "sms_alerts": false
  }
}
```

**Characteristics:**
- Flexible structure
- Self-describing (tags/keys provide context)
- Can evolve over time

**When to use:** APIs, configuration files, data exchange between systems

### Database Types: Picking Your Tool

Now that we understand data types, let's look at the databases designed to store them!

#### **Relational Databases (RDBMS)** 🗄️

**What are they?**
Relational Database Management Systems (RDBMS) store data in tables with defined relationships between them. They use **SQL** (Structured Query Language) to query data.

**Popular Examples:**
- PostgreSQL
- MySQL
- Oracle
- SQL Server

**Best for:**
- Structured data
- Complex queries with joins
- ACID transactions (Atomicity, Consistency, Isolation, Durability)
- Financial systems, e-commerce, CRM systems

**Key Concepts:**
- **Tables** - Store data in rows and columns
- **Primary Keys** - Uniquely identify each row
- **Foreign Keys** - Create relationships between tables
- **Normalization** - Reducing redundancy (we'll cover this later!)

**Example Use Case:**
An online bookstore needs to track customers, orders, books, and authors with complex relationships between them. Perfect for RDBMS!

#### **NoSQL Databases** 🚀

**What are they?**
"Not Only SQL" databases are designed for specific data models and have flexible schemas. They sacrifice some ACID properties for scalability and flexibility.

**Types of NoSQL Databases:**

1. **Document Databases** (e.g., MongoDB, CouchDB)
   - Store data as JSON-like documents
   - Great for semi-structured data
   - Flexible schema

2. **Key-Value Stores** (e.g., Redis, DynamoDB)
   - Simple lookup based on keys
   - Extremely fast
   - Great for caching and session management

3. **Column-Family Stores** (e.g., Cassandra, HBase)
   - Optimized for queries over large datasets
   - Great for time-series data

4. **Graph Databases** (e.g., Neo4j, Amazon Neptune)
   - Designed for data with complex relationships
   - Perfect for social networks, recommendation engines

**Best for:**
- Unstructured or semi-structured data
- Need to scale horizontally (add more servers)
- Flexible schema requirements
- Real-time big data applications

**Example Use Case:**
A social media platform storing user posts, comments, likes - where the schema might change frequently and you need massive scale. NoSQL is your friend!

#### **Object Storage** 📦

**What is it?**
Storage for unstructured data like images, videos, backups, and large files. Each object includes the data, metadata, and a unique identifier.

**Popular Examples:**
- Amazon S3
- Google Cloud Storage
- Azure Blob Storage

**Best for:**
- Large media files
- Backups and archives
- Data lakes

**Example Use Case:**
A video streaming platform storing millions of video files with metadata about each video.

### Making the Right Choice 🤔

Here's a quick decision guide I made for myself:

| Need | Choose |
|------|--------|
| Complex queries with relationships | **RDBMS** (PostgreSQL, MySQL) |
| Flexible schema, horizontal scaling | **NoSQL** (MongoDB, Cassandra) |
| Fast key-value lookups | **Key-Value Store** (Redis) |
| Large file storage | **Object Storage** (S3) |
| Graph/network relationships | **Graph Database** (Neo4j) |
| ACID compliance is critical | **RDBMS** |
| Ultra-low latency required | **In-memory database** (Redis) |

**Pro Tip:** In the real world, you'll often use **multiple database types** in the same system! This is called "polyglot persistence." For example:
- PostgreSQL for transactional data (orders, customers)
- Redis for caching and sessions
- S3 for image storage
- Elasticsearch for full-text search

---

## My Learning Journey Reflections 💭

### What Surprised Me

1. **There's no "best" database** - The right choice depends entirely on your use case
2. **Data modeling isn't just about diagrams** - It's about deeply understanding your data and how it will be used
3. **The choices you make early matter** - Changing database types or restructuring data later is expensive and painful

### What I Wish I Knew Earlier

- **Start simple, iterate later** - Don't over-engineer your data model from day one
- **Think about queries, not just storage** - Model your data based on how you'll access it
- **Redundancy isn't always evil** - Sometimes denormalization makes sense for performance (more on this in later chapters!)

### Resources That Helped Me

Here are the resources I found most helpful (all linked in my repository):

**Data Modeling:**
- [Airbyte: Data Modeling — The Unsung Hero of Data Engineering](https://airbyte.com/blog/data-modeling-unsung-hero-data-engineering-introduction)
- [AWS: What is Data Modeling?](https://aws.amazon.com/what-is/data-modeling/)
- [GeeksforGeeks: Problem of Redundancy in Database](https://www.geeksforgeeks.org/dbms/the-problem-of-redundancy-in-database/)

**Database Types:**
- [GeeksforGeeks: Structured vs Unstructured Data](https://www.geeksforgeeks.org/difference-between-structured-data-and-unstructured-data/)
- [IBM: Structured vs Unstructured Data](https://www.ibm.com/think/topics/structured-vs-unstructured-data)
- [MongoDB: NoSQL Explained](https://www.mongodb.com/nosql-explained)
- [Guru99: Types of Databases](https://www.guru99.com/types-of-database.html)

---

## What's Next? 🚀

In the upcoming chapters of this series, we'll dive into:
- **Entity-Relationship Diagrams (ERD)** - How to actually design a data model
- **Normalization** - Making your database efficient and maintainable
- **Keys and Relationships** - The glue that holds relational databases together
- **Docker and Containerization** - Running databases in modern environments
- **Hands-on Projects** - Real-world data modeling exercises

### Try This Yourself! 💪

Before moving on, try this exercise:
1. Think of an app or system you use daily (e.g., Instagram, a food delivery app, a library system)
2. List out the main "things" it needs to store (users, posts, orders, etc.)
3. Ask yourself:
   - What type of data is this? (Structured, semi-structured, unstructured?)
   - What database type would be best?
   - What relationships exist between different data?

This mental exercise will help you start thinking like a data engineer!

---

## Final Thoughts 🌟

Data modeling and understanding database types are foundational skills for any data engineer. They might seem dry or theoretical at first, but they're the bedrock of everything else you'll build in your career.

Remember:
- **Data modeling prevents chaos** by giving structure to your data
- **Different databases serve different purposes** - learn when to use which
- **Think before you build** - time spent on good data modeling saves headaches later

I'm still learning, and this blog is part of my journey to document what I discover. If you're on a similar path, I hope this helps!

Feel free to check out my [GitHub repository](https://github.com/Akina-Aoki/data_modelling_aira_franco_de25) where I keep all my notes, exercises, and code examples. We're all learning together!

---

**Next in the series:** *Part 2: Data Modeling Techniques - ERD and Conceptual Modeling*

**Stay curious, keep learning!** 🎓

---

*This post is part of my learning journey in OLTP data modeling. All code examples and exercises are available in my [repository](https://github.com/Akina-Aoki/data_modelling_aira_franco_de25). Found this helpful? Let's connect and learn together!*

**Tags:** #DataEngineering #DataModeling #Databases #OLTP #SQL #NoSQL #PostgreSQL #MongoDB #LearningInPublic #DataEngineer

---

### Quick Reference Cheat Sheet 📋

**RDBMS (SQL Databases):**
- ✅ Structured data
- ✅ Complex queries with joins
- ✅ ACID transactions
- ✅ Well-defined schemas
- ❌ Horizontal scaling can be challenging
- **Examples:** PostgreSQL, MySQL, Oracle

**NoSQL Databases:**
- ✅ Flexible schemas
- ✅ Horizontal scaling
- ✅ Semi-structured/unstructured data
- ✅ High performance at scale
- ❌ May sacrifice ACID properties
- **Examples:** MongoDB, Cassandra, Redis, Neo4j

**Object Storage:**
- ✅ Large file storage
- ✅ Unstructured data (images, videos)
- ✅ Highly scalable
- ✅ Cost-effective for archives
- ❌ Not for transactional data
- **Examples:** Amazon S3, Google Cloud Storage

**Remember:** The best database is the one that fits your specific use case! 🎯
