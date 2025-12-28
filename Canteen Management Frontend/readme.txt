# DIU Campus Canteen - Food Ordering System

A modern, responsive frontend web application for managing a university campus canteen's food ordering system. Built with pure HTML, CSS, and JavaScript.

## 🌟 Features

### 🍔 Menu & Food Management
- **Category Filtering**: Filter food items by categories (Burgers, Pizza, Pasta, etc.)
- **Real-time Search**: Search through food items by name or description
- **Availability Status**: Visual indicators for available/unavailable items
- **Detailed Food Cards**: Each item displays image, description, preparation time, and price

### 🛒 Shopping Cart
- **Add/Remove Items**: Easily add or remove items from cart
- **Quantity Control**: Increase/decrease item quantities
- **Real-time Calculations**: Automatic calculation of subtotal, delivery fee, and total
- **Cart Badge**: Visual notification of items in cart

### 📦 Order Management
- **Order Tracking**: Visual timeline showing order status (Pending → Preparing → Ready → Delivering → Delivered)
- **Order History**: View past delivered orders
- **Real-time Updates**: Order status automatically progresses every 10 seconds
- **Active Orders Badge**: Notification badge for pending orders

### 💳 Checkout System
- **Location Selection**: Choose from multiple campus delivery locations
- **Phone Verification**: Input validation for Bangladeshi phone numbers
- **Order Summary**: Clear breakdown of costs
- **Cash on Delivery**: Simple payment system

## 🚀 Getting Started

### Prerequisites
- Modern web browser (Chrome, Firefox, Safari, Edge)
- No additional installations required

### Installation
1. Clone the repository:
   git clone https://github.com/yourusername/diu-canteen-system.git

2. Navigate to the project directory:
   cd diu-canteen-system

3. Open `index.html` in your web browser:
   # On macOS/Linux
   open index.html
   
   # On Windows
   start index.html

   OR simply double-click the `index.html` file

## 📁 Project Structure

diu-canteen-system/
│
├── index.html          # Main HTML file
├── style.css           # Stylesheet
│
├── README.md           # This file
└── (optional assets/ directory for images)

## 🎨 Design Features

- **Responsive Design**: Works on mobile, tablet, and desktop devices
- **Modern UI**: Clean, intuitive interface with green color scheme
- **Interactive Elements**: Hover effects, transitions, and animations
- **Accessibility**: Semantic HTML and keyboard navigation support
- **Empty States**: Helpful messages when no data is available

## 🔧 Technical Details

### Data Structure
// Food items contain:
{
  id: number,
  name: string,
  category: string,
  price: number,
  image: string,
  description: string,
  prepTime: string,
  isAvailable: boolean
}

### State Management
- Simple JavaScript state object
- Persistent within browser session
- Real-time rendering updates

### Key Functions
- `renderFoodGrid()`: Displays filtered food items
- `renderCart()`: Updates cart view and calculations
- `renderOrders()`: Shows order tracking and history
- `handleCheckout()`: Processes new orders

## 🎯 Usage Examples

### Adding Items to Cart
1. Browse the menu
2. Click "Add" button on any available item
3. View cart by clicking the cart icon
4. Adjust quantities as needed

### Placing an Order
1. Add items to cart
2. Click "Proceed to Checkout"
3. Select delivery location
4. Enter phone number
5. Confirm order

### Tracking Orders
1. Navigate to "My Orders" tab
2. View active orders with progress timeline
3. Check order history for past deliveries

## 📱 Responsive Breakpoints

- **Mobile**: < 480px (single column layout)
- **Tablet**: 481px - 768px (responsive grid)
- **Desktop**: > 769px (full-featured layout)

## 🛠️ Customization

### Adding New Food Items
Edit the `foodItems` array in `index.html`:
{
  id: 11,
  name: 'New Item',
  category: 'Category',
  price: 100,
  image: 'image_url.jpg',
  description: 'Item description',
  prepTime: '10-15 min',
  isAvailable: true
}

### Modifying Categories
Update the `categories` array in `index.html`:
const categories = ['All', 'NewCategory', 'ExistingCategory'];

### Changing Delivery Locations
Edit the `<select>` options in the checkout modal section.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (git checkout -b feature/AmazingFeature)
3. Commit your changes (git commit -m 'Add some AmazingFeature')
4. Push to the branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

- Icons from Lucide Icons (https://lucide.dev)
- Food images from Unsplash (https://unsplash.com)
- Color scheme inspired by modern food delivery apps

## 📞 Support

For support, please open an issue in the GitHub repository or contact the development team.

---

**Made with ❤️ for Daffodil International University**