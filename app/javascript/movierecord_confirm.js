function check(){
    if(window.confirm('本当に削除しますか？')){ 
      return true;
    }
    else{
      window.alert('キャンセルされました'); 
      return false; 
    }
  }


   // いいね関連
  document.addEventListener('turbo:load', () => {
    const likeButton = document.getElementById('like');
  
    likeButton.addEventListener('ajax:success', (event) => {
      const [data, _status, xhr] = event.detail;
      if (data.success) {
        Turbo.visit(window.location, { action: "replace" }); // ページ全体を再読み込み
      }
    });
  
    likeButton.addEventListener('ajax:error', () => {
      alert('エラーが発生しました');
    });
  });