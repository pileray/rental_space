import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { latitude: Number,
                    longitude: Number,
                    mapId: String }

  connect() {
    this.renderMap(this.latitudeValue, this.longitudeValue);
  }
  
  async renderMap(lat, lng) {
    const mapId = this.mapIdValue;
    const position = { lat: lat, lng: lng };

    // Request needed libraries.
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

    // The map, centered at the given position
    const map = new Map(this.element, {
      zoom: 16,
      center: position,
      mapId: mapId,
    });

    // The marker, positioned at the given position
    const marker = new AdvancedMarkerElement({
      map: map,
      position: position,
    });
  }
}
