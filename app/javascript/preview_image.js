document.addEventListener('DOMContentLoaded', function() {
    const imageInput = document.getElementById('image-input');
    const previewImage = document.getElementById('preview');
  
    imageInput.addEventListener('change', function() {
      const selectedImage = imageInput.files[0];
      if (selectedImage) {
        const objectUrl = URL.createObjectURL(selectedImage);
        previewImage.src = objectUrl;
      }
    });
  });