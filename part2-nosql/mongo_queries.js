// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "E001",
    name: "Smartphone",
    category: "Electronics",
    price: 25000,
    brand: "Samsung A5",
    specs: {
      ram: "8GB",
      storage: "128GB",
      battery: "5000mAh"
    },
    warranty_years: 1,
    available: true
  },
  {
    product_id: "G001",
    name: "Milk Pack",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutrition: {
      fat: "3%",
      protein: "3.2g"
    },
    tags: ["dairy", "daily_use"],
    available: true
  },
  {
    product_id: "F001",
    name: "Office Chair",
    category: "Furniture",
    price: 7000,
    material: "Wood + Cushion",
    dimensions: {
      height: "4ft",
      width: "2ft"
    },
    colors_available: ["Black", "Brown"],
    available: true
  }
]);

// OP2: find() — Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent field
db.products.updateOne(
  { product_id: "E001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category field
db.products.createIndex({ category: 1 });
