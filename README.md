# E-Commerce Web Application

A modern **E-Commerce Web Application** that allows users to browse products, manage a wishlist, add items to the cart, and manage their personal profile.

The application provides a responsive interface and essential e-commerce features to simulate an online shopping experience.

---

## Features

* User Signup and Login
* Profile management
* Browse products
* Product details page
* Add products to cart
* Update product quantity in cart
* Remove products from cart
* Add products to wishlist
* Move wishlist items to cart
* Responsive design for mobile and desktop

---

## Tech Stack

**Frontend**

* React / Next.js
* Tailwind CSS

**Backend**

* Node.js
* Express / Next.js API Routes

**Database**

* MongoDB

**Authentication**

* JWT (JSON Web Token)

**Deployment**

* Vercel

---

## Project Structure

```text
ecommerce-app
│
├── components
│   ├── Navbar.jsx
│   ├── ProductCard.jsx
│   ├── ProductGrid.jsx
│   ├── CartItem.jsx
│   ├── WishlistItem.jsx
│   └── ProfileCard.jsx
│
├── pages
│   ├── index.jsx
│   ├── products.jsx
│   ├── cart.jsx
│   ├── wishlist.jsx
│   └── profile.jsx
│
├── pages/api
│   ├── auth
│   ├── products
│   ├── cart
│   ├── wishlist
│   └── user
│
├── models
│   ├── User.js
│   ├── Product.js
│   └── Cart.js
│
├── lib
│   └── mongodb.js
│
├── styles
│   └── globals.css
│
├── package.json
└── README.md
```

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/your-username/ecommerce-app.git
```

### 2. Navigate to the project folder

```bash
cd ecommerce-app
```

### 3. Install dependencies

```bash
npm install
```

### 4. Create environment variables

Create a `.env.local` file and add:

```env
MONGODB_URI=your_mongodb_connection_string
JWT_SECRET=your_secret_key
```

### 5. Run the development server

```bash
npm run dev
```

The application will run at:

```
http://localhost:3000
```

---

## API Endpoints

### Authentication

| Method | Endpoint         | Description         |
| ------ | ---------------- | ------------------- |
| POST   | /api/auth/signup | Register a new user |
| POST   | /api/auth/login  | Login user          |

### Products

| Method | Endpoint          | Description         |
| ------ | ----------------- | ------------------- |
| GET    | /api/products     | Get all products    |
| GET    | /api/products/:id | Get product details |

### Cart

| Method | Endpoint         | Description         |
| ------ | ---------------- | ------------------- |
| POST   | /api/cart/add    | Add product to cart |
| GET    | /api/cart        | Get cart items      |
| PUT    | /api/cart/update | Update quantity     |
| DELETE | /api/cart/remove | Remove product      |

### Wishlist

| Method | Endpoint             | Description             |
| ------ | -------------------- | ----------------------- |
| POST   | /api/wishlist/add    | Add product to wishlist |
| GET    | /api/wishlist        | Get wishlist items      |
| DELETE | /api/wishlist/remove | Remove from wishlist    |

---

## User Interface

The application includes the following pages:

* **Home Page** – Displays featured products
* **Products Page** – Browse all available products
* **Product Details Page** – Detailed view of each product
* **Cart Page** – Manage items added to cart
* **Wishlist Page** – View saved products
* **Profile Page** – Manage user information

---

## Future Improvements

* Payment gateway integration
* Order history tracking
* Product reviews and ratings
* Admin dashboard for product management
* Advanced filtering and sorting

---

## Author

**Siddharth Malik**
B.Tech Student – Bennett University
