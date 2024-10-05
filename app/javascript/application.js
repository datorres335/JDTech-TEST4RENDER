// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


let slideIndex = 0;

function showSlides() {
    let slidesWrapper = document.querySelector(".slides-wrapper");
    let slides = document.querySelectorAll(".mySlides");

    slideIndex++;
    if (slideIndex >= slides.length) {
        slideIndex = 0; // Reset to first slide
    }

    // Slide the container by adjusting the transform property
    slidesWrapper.style.transform = `translateX(-${slideIndex * 100}%)`;

    console.log(`Current slide index: ${slideIndex}`); // Debugging
    setTimeout(showSlides, 3000); // Change image every 3 seconds
}

// Initialize slides
window.addEventListener('DOMContentLoaded', () => {
    showSlides(); // Start sliding effect
});
