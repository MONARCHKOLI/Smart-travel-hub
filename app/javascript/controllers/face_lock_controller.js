import { Controller } from "@hotwired/stimulus"
import * as faceapi from "face-api.js"

export default class extends Controller {
  static targets = ["video", "status", "faceSection", "passwordSection", "faceBtn", "passwordBtn", "form"]

  connect() {
    this.showPassword() 
  }

  showPassword() {
    this.passwordSectionTarget.classList.remove("hidden")
    this.faceSectionTarget.classList.add("hidden")
    this.passwordBtnTarget.classList.add("bg-white", "shadow-sm")
    this.faceBtnTarget.classList.remove("bg-white", "shadow-sm")
    this.stopVideo()
  }

  async showFace() {
    this.passwordSectionTarget.classList.add("hidden")
    this.faceSectionTarget.classList.remove("hidden")
    this.faceBtnTarget.classList.add("bg-white", "shadow-sm")
    this.passwordBtnTarget.classList.remove("bg-white", "shadow-sm")
    
    this.statusTarget.innerText = "Initializing AI..."
    await Promise.all([
      faceapi.nets.tinyFaceDetector.loadFromUri('/models'),
      faceapi.nets.faceLandmark68Net.loadFromUri('/models')
    ])
    this.startVideo()
  }

  startVideo() {
    navigator.mediaDevices.getUserMedia({ video: {} })
      .then(stream => { this.videoTarget.srcObject = stream })
  }

  stopVideo() {
    if (this.videoTarget.srcObject) {
      this.videoTarget.srcObject.getTracks().forEach(track => track.stop())
      this.videoTarget.srcObject = null
    }
  }

  // --- THIS WAS MISSING ---
  async authenticate() {
    this.statusTarget.innerText = "Scanning face..."
    
    const detection = await faceapi.detectSingleFace(
      this.videoTarget, 
      new faceapi.TinyFaceDetectorOptions()
    ).withFaceLandmarks()

    if (detection) {
      this.statusTarget.innerText = "Face Detected! Logging in..."
      // Submit the hidden password form (pre-filled or linked to user)
      this.formTarget.submit()
    } else {
      this.statusTarget.innerText = "Face not recognized. Try again."
    }
  }
}
