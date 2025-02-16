<?php
require_once 'db.php';

$searchTerm = isset($_GET['search']) ? trim($_GET['search']) : '';
$results = [];

if ($searchTerm !== '') {
    $stmt = $pdo->prepare("SELECT * FROM products WHERE LOWER(title) LIKE LOWER(?) ORDER BY id DESC");
    $stmt->execute([$searchTerm . '%']);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<div class="products-grid">  <!-- Reuse the same grid container class -->
  <?php if (count($results) > 0): ?>
    <?php foreach ($results as $prod): ?>
      <div class="product-card">  <!-- Reuse the same product-card class -->
        <img src="<?php echo htmlspecialchars($prod['image_url']); ?>" 
             alt="<?php echo htmlspecialchars($prod['title']); ?>">
        <h3><?php echo htmlspecialchars($prod['title']); ?></h3>
        <p class="price">$<?php echo number_format($prod['price'], 2); ?></p>
        <p><?php echo htmlspecialchars($prod['description']); ?></p>
        <button class="btn add-to-cart"
                data-id="<?php echo $prod['id']; ?>"
                data-title="<?php echo htmlspecialchars($prod['title']); ?>"
                data-price="<?php echo htmlspecialchars($prod['price']); ?>">
          Add to Cart
        </button>
      </div>
    <?php endforeach; ?>
  <?php else: ?>
    <p style="padding:1rem;">No products found matching your search.</p>
  <?php endif; ?>
</div>
