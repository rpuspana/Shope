## Shope virtual bookstore

Shope is a beautiful e-commerce web application, namely a virtual bookstore.
It has three types of users, each with unique privileges : clients, vendors, the admin

### Documentation
The application has three types of users (client, vendor, admin), each with his unique capabilities within the web app

#### The client
- uses a link to visualize all the books of the site.
  For this version of the app, use http://localhost:3000/store
- search a book by its title
- buy book(s)
- add a book to his shopping cart
- see the contents of his shopping cart
- add more copies, delete copies of each book/all books while in his shopping cart
- fills in/edits his checkout form in order to buy the books in the shopping cart, thus creating a book order
- receives a receipt with his order details

#### The vendor
- log in to/log out of his account
  For this version of the app, use http://localhost:3000/admin/login
- upload a book to sale, with the help of a form (form's fields are validated at submit)
- assess the book catalog (all the books he has uploaded to the site)
- he can click on a cover to see more details about this book, edit by its title details, or delete a book
- search for a book that he has put up for sale
- access the client orders catalog he has received from the clients, since his account was created on the site
- access any client order to learn more details about the client and the order placed

### The admin
- log in to this account, created previously by his superior. Log out.
  For this version of the app, use http://localhost:3000/admin/login
- access the site's vendor catalog
- search for a specific vendor
- accept/deny a vendor request to register with the site
- changing the vendor access on the site: OK, ban, block
- access a catalog of all the vendors registered on the site
- create a new vendor account, edit the details of an existing vendor account, delete a vendor account
- access the book catalog of each vendor, and all the details for each of these books
- access each order of a book vendor
- once on a vendor's account, the admin can do a few operations.
 - searching for a book order that a vendor had
 - search through the vendor's books

### Technologies used
- Backend
 - Ruby
 - Ruby on Rails
 - Mongrel
 - SQLite
- Front-end
 - JavaScript
 - HTML
 - CSS

## Get the party started
   Read "General description of a Ruby on Rails project" document to better understand a Ruby on Rails project and find out more about the technology
