// Import and register all your controllers from the importmap via controllers/**/_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Import the new slideshow controller
import SlideshowController from "./slideshow_controller"

// Eager load all controllers defined in the import map under controllers/*
eagerLoadControllersFrom("controllers", application)

// Register the slideshow controller manually
application.register("slideshow", SlideshowController)
