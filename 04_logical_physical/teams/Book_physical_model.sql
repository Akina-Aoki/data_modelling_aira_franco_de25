CREATE TABLE "Member" (
  "member_id" INTEGER PRIMARY KEY,
  "member_name" VARCHAR NOT NULL,
  "phone" INTEGER NOT NULL
);

CREATE TABLE "Borrow" (
  "borrow_id" INTEGER PRIMARY KEY,
  "borrow_date" DATE NOT NULL,
  "member_id" INTEGER NOT NULL
);

CREATE TABLE "BorrowItem" (
  "borrow_item_id" INTEGER PRIMARY KEY,
  "borrow_id" INTEGER NOT NULL,
  "item_nr" SMALLINT NOT NULL,
  "book_id" INTEGER NOT NULL
);

CREATE TABLE "BookCopy" (
  "book_id" INTEGER PRIMARY KEY,
  "ISBN_number" TEXT NOT NULL,
  "copy_nr" INTEGER NOT NULL
);

CREATE TABLE "Book" (
  "ISBN_nr" TEXT PRIMARY KEY,
  "title" TEXT NOT NULL,
  "author" TEXT NOT NULL
);

COMMENT ON COLUMN "BorrowItem"."borrow_item_id" IS 'this is a surrogate key combine borriw_id';

ALTER TABLE "Borrow" ADD FOREIGN KEY ("member_id") REFERENCES "Member" ("member_id");

ALTER TABLE "BorrowItem" ADD FOREIGN KEY ("borrow_id") REFERENCES "Borrow" ("borrow_id");

ALTER TABLE "BorrowItem" ADD FOREIGN KEY ("book_id") REFERENCES "BookCopy" ("book_id");

ALTER TABLE "BookCopy" ADD FOREIGN KEY ("ISBN_number") REFERENCES "Book" ("ISBN_nr");
