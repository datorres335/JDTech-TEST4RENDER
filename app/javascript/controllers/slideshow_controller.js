import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide"]

  initialize() {
    this.slideIndex = 0;
    this.showSlides();
  }

  showSlides() {
    let slides = this.slideTargets;

    this.slideIndex++;
    if (this.slideIndex >= slides.length) {
      this.slideIndex = 0;
    }

    slides.forEach((slide, index) => {
      slide.style.transform = `translateX(-${this.slideIndex * 100}%)`;
    });

    setTimeout(() => this.showSlides(), 3000); // Change image every 3 seconds
  }
}
