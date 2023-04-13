# Complete_E-Library_Project_Using_Java
This Is A complete E library project which can perform all the operations .

Requirements : 1> Book Listing :

We need a way for us to see the list of books that we have in our library. The list should appear in an easy-to-view and aesthetically pleasing way. The name of the book and author should be visible along with images of the book The list of books should appear nicely on a mobile device as well.

2> Book Detail :

Clicking on the book should take us to a book detail page. There we should see the image picture and all the information that we have about the book. We should have a way to go back to the book list as well. The page should appear nicely on a mobile device

3> Adding a new book :

We need to have a way to add books as well The button to add books should appear on the top of the books listing. Clicking on it will take the user to a new page, where the form will appear to add books The information that we will collect for a book would be Name Picture Description Author Name Once a book is added, the user should be taken to the book detail page and a confirmation message should be shown that the book addition has been successful.

4> Reading a book :

There should be an option to read the book details

5> Deleting a book :

There should be a way to delete a particular book. Once a book is deleted, the confirmation message should be shown that the book has been deleted successfully from the book list.

6> Editing the book details :

We need to have a way to edit book details as well, the information that you collected for a book should be editable. There should be a proper form to do that along with the validation. Once a book is edited, the confirmation message should be shown that the book has been edited successfully.

7> Search functionality :

There should be a way to search a book by its name, or by author’s name. If the search button is clicked, only the books with matching search should appear in the list. The user should be able to clearly see what he/she has searched for. There should be a one-click option to reset the search. The search field should appear nicely on a mobile device. Search functionality should also work fine with pagination in case there are several search results.

Other Important Functionality
User roles and permissions This app will now support two types of users. First are readers who are just there to read books. Second are admins who can manage the books and can manage readers as well. Readers will not be able to see the book management functionality. If they try to go directly with the URL they should see a “403 Not Allowed” error.

8> Registration and login :

Readers should be able to create new accounts (register) and can see their dashboard. Anyone can access the readers registration form. No login required. Admins should be able to create new accounts (register). Only an existing admin can access the admin registration form. Admin login is required. The first admin will be manually created from the database. There should be a logout button for both readers and admins. If a user is not logged in, they shouldn’t see any page except login and reader registration.

Email verification on sign up :
After registration form submission, users should see a page saying “please verify your email”. The user receives an email with a unique link. Upon clicking, it takes the user to a page with the message “Your email is verified”. The email verification link should not be easy to guess. Email verification is also needed when an admin adds another admin. Users should not be able to log in until the email is marked verified. When tried to log in, it will show invalid credentials messages like in the general case. The email verification link should expire after 120 minutes. After expiry, the user will see a message “Link expired”. “Forgot Password” option for the users on the login window which must send a password reset link to the registered email address. When clicked on a forgotten password, the user sees a page to enter their email address. When clicked on, the user receives a unique forgot password link. Upon clicking, it takes the user to a page to enter a new password. The password reset link should not be easy to guess. After successful password reset, the user is asked to log in again with the new password. The password reset link should expire after 120 minutes. After expiry, the user will see a message “Link expired”.

10> Readers :

Readers will see the list of all the books available in the library Readers can mark which books they’ve read Readers can mark which books they want to read Readers can also mark which books they currently have taken from the library and are reading Readers cannot mark a book as currently reading if it’s already taken by someone else Readers can only take one book at a time. In order to read another book, they must mark the previous one as either “I’ve read this book” or “I’m returning this book”.

11> Admins :

Admins will have all the functionalities available to them as readers. In addition to that, they will have more options like: User management functionality List of all the admins Option to create or edit an admin. Three fields: name, email and password. Option to delete an admin (an admin cannot delete himself)

12> Book management functionality :

List of all the books Option to create or edit a book. Three fields: name, cover image and author. Option to delete a book Option to manage counts of a book (this will be an additional field in create/edit book form) Option to search books by “Book name” and “Author name” - Refer Prep-1 for more details Option to sort book by book name alphabetical order - ascending or descending. Refer Prep-1 for more details. Book copies and count There can be more than one copy for each book. This number will be configured from the book to create or edit the screen. The number of copies for a book should be highlighted in the book listing page. It should be easy to understand for viewers

There is the completet solution for this problem * * Can Check The Code for the solution *
