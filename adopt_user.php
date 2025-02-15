<?php
session_start();
require_once __DIR__ . '/db.php';

// Check if user is logged in via cookie (for adopt page, we rely on the cookie)
$isLoggedIn = isset($_COOKIE['loggedInUser']);
$username   = $isLoggedIn ? $_COOKIE['loggedInUser'] : '';

// Fetch all adoptable pets from the DB
$petsStmt = $pdo->query("SELECT * FROM pets ORDER BY id DESC");
$pets = $petsStmt->fetchAll(PDO::FETCH_ASSOC);

// If you need products, you can fetch them too:
$stmt = $pdo->query("SELECT * FROM products ORDER BY id DESC");
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Separate products into cat/dog arrays if needed
$catProducts = array_filter($products, function($prod) {
    return strtolower($prod['category']) === 'cat';
});
$dogProducts = array_filter($products, function($prod) {
    return strtolower($prod['category']) === 'dog';
});
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Adopt a pet and save a life.">
  <meta name="keywords" content="Pet Adoption, Animal Shelter, Cats, Dogs">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>PetStore | Adopt Page</title>
  
  <!-- Link to your external CSS for adopt page -->
  <link rel="stylesheet" href="css/adopt.css">
  
  <!-- Pass PHP variables to JS -->
  <script>
    const isLoggedIn = <?php echo $isLoggedIn ? 'true' : 'false'; ?>;
    const currentUser = <?php echo json_encode($username); ?>;
  </script>
  
  <!-- Link to your external JS for adopt page -->
  <script src="js/adopt.js" defer></script>
</head>
<body>
  <!-- Header -->
  <header>
    <div class="logo">
      <a href="index.php">PetStore</a>
    </div>
    <nav>
      <a href="index.php">Go Back</a>
    </nav>
  </header>

  <!-- Hero Section -->
  <section class="hero-section">
    <!-- Ensure 'adopt.jpg' is placed in /uploads/adopt.jpg if you want it there -->
    <img src="uploads/adopt.jpg" alt="Hero Dog" />
    <div class="hero-overlay"></div>
    <div class="hero-content">
      <h1>Give a Friend a Forever Home</h1>
      <p>Adopting a pet saves not just one life, but two—the pet’s and the new space you open at the shelter.</p>
      <button onclick="scrollToPets()">Meet Our Pets</button>
    </div>
  </section>

  <!-- Pets Section -->
  <section class="pets-section" id="petsSection">
    <h2>Meet the Adorable Friends Waiting for You</h2>
    <div class="pets-grid">
      <!-- Dynamic pets from the DB -->
      <?php foreach ($pets as $pet): ?>
        <div class="pet-card">
          <!-- Make sure your DB 'image_url' is just the filename, e.g. 'dogs1.jpg', then prepend 'uploads/' here -->
          <img src="<?php echo htmlspecialchars($pet['image_url']); ?>" alt="<?php echo htmlspecialchars($pet['name']); ?>">
          <div class="pet-card-content">
            <h3><?php echo htmlspecialchars($pet['name']); ?></h3>
            <p><strong>Age:</strong> <?php echo htmlspecialchars($pet['age']); ?> years old</p>
            <p><?php echo htmlspecialchars($pet['description']); ?></p>
            <button class="adopt-button" data-pet-id="<?php echo $pet['id']; ?>">Adopt</button>
          </div>
        </div>
      <?php endforeach; ?>
      
      
    </div>
  </section>

  <!-- Next Arrow -->
  <div class="next-arrow">
    <a href="#saveLifeStory">&#8594;</a>
  </div>

  <!-- Save a Life Story Section -->
  <section class="save-life-section" id="saveLifeStory">
    <h2>Save a Life Story</h2>
    <p>
      When you adopt, you help more than just one pet. Shelters operate at capacity,
      often turning away animals in need because there simply isn't enough room.
      By taking one pet home, you free up space for the shelter to rescue another—
      effectively saving two lives.
    </p>
    <p>
      It’s not just about numbers, though. Each adoption story is a personal journey.
      Pets come from varied backgrounds—some were strays, others were surrendered,
      and many have overcome hardships. By offering them a loving home, you change
      their world forever. And in return, you’ll find your life enriched by their
      companionship, loyalty, and endless gratitude.
    </p>
  </section>

  <!-- Adoption Modal -->
  <div id="adoptionModal" class="modal">
    <div class="modal-content">
      <span class="close-button">&times;</span>
      <h2>Adoption Request</h2>
      <form id="adoptionForm">
        <!-- Hidden field for pet id -->
        <input type="hidden" id="pet_id" name="pet_id" value="">
        <label for="adopterAge">Your Age:</label>
        <input type="number" id="adopterAge" name="adopterAge" required>
        <label for="adoptionReason">Why do you want to adopt?</label>
        <textarea id="adoptionReason" name="adoptionReason" rows="4" required></textarea>
        <button type="submit">Submit Request</button>
      </form>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <p>© 2025 PetStore Organization. All Rights Reserved.</p>
  </footer>
</body>
</html>
