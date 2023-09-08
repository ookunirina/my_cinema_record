function searchMovieTitles(query) {
    const apiKey = process.env.TMDB_API_KEY;
    const url = `https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&language=ja-JP&query=${query}`;
    
  
    return fetch(url)
      .then(response => response.json())
      .then(data => data.results)
      .catch(error => console.error(error));
  }

  document.addEventListener('DOMContentLoaded', function() {
    const titleInput = document.querySelector('input[name="movierecord[title]"]');
    const dataList = document.getElementById('movie-titles');
  
    titleInput.addEventListener('input', function() {
      if (titleInput.value.length >= 2) {
        searchMovieTitles(titleInput.value).then(titles => {
          dataList.innerHTML = ''; // 以前の検索結果を削除
          for (const movie of titles) {
            const option = document.createElement('option');
            option.value = movie.title;
            dataList.appendChild(option);
          }
        });
      }
    });
  });