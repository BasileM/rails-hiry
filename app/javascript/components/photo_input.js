const photoInput = document.getElementById('room_images_attributes_0_photo');
if (photoInput) {
  photoInput.addEventListener('change', (e) => {
    const photoName = e.currentTarget.value;
    const fileName = photoName.replace(/^(.*[\\\/])/, "")
    document.querySelector('.room_images_photo .custom-file-label').innerText = fileName;
  });
}
