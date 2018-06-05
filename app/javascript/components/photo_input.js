const photoInput = document.getElementById('room_images_attributes_0_photo');
if (photoInput) {
  photoInput.addEventListener('change', (e) => {
    const photoName = e.currentTarget.value;
    console.log(photoName);
  });
}
