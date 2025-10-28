# ERD SISTEM PERPUSTAKAAN
Gambaran erd untuk sistem peminjaman buku di perpustakaan

## PREVIEW

```mermaid
erDiagram

book {
    int id
    string title
    string author
    string publisher
    int billed_year
    int category_id
    int bookshelf_id
    int officer_id
}

category {
    int id
    string category_name
    string description
}

bookshelf {
    int id
    string shelf_code
    string book_location
}

officer {
    int id
    string officer_name
}

borrower {
    int id
    string borrowers_name
    string borrower_address
    int officer_id
}

borrowing {
    int id
    int borrower_id
    int book_id
    date borrow_date
    date return_date
}

category ||--o{ book : "own"
bookshelf ||--o{ book : "keep"
officer ||--o{ book : "input"
officer ||--o{ borrower : "serve"
borrower ||--o{ borrowing : "makes"
book ||--o{ borrowing : "involves"


```