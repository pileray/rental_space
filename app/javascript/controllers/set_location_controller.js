import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-location"
export default class extends Controller {
  static targets = ["latitude", "longitude", "map"]
  static values = { mapId: String }

  connect() {
    this.renderMap();
  }
  
  async renderMap() {
    const mapId = this.mapIdValue;
    const initialPosition = { lat: 35.6, lng: 139.7 };
    
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

    const map = new Map(this.mapTarget, {
      zoom: 16,
      center: initialPosition,
      mapId: mapId,
    });

    const marker = new AdvancedMarkerElement({
      map: map,
      position: initialPosition
    });

    map.addListener("click", (e) => {
      marker.position = e.latLng
      this.latitudeTarget.value = e.latLng.lat()
      this.longitudeTarget.value = e.latLng.lng()
    });
  }
}
