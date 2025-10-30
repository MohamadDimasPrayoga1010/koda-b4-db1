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
    timestamp created_at
    timestamp updated_at
}

bookshelf {
    int id
    string shelf_code
    string book_location
    timestamp created_at
    timestamp updated_at
}

officer {
    int id
    string officer_name
    timestamp created_at
}

borrower {
    int id
    string borrowers_name
    string borrower_address
    int officer_id
    timestamp created_at
    timestamp updated_at
}

borrowing {
    int id
    int borrower_id
    int book_id
    date borrow_date
    date return_date
    timestamp created_at
    timestamp updated_at
}

category ||--o{ book : "own"
bookshelf ||--o{ book : "keep"
officer ||--o{ book : "input"
officer ||--o{ borrower : "serve"
borrower ||--o{ borrowing : "makes"
book ||--o{ borrowing : "involves"


```