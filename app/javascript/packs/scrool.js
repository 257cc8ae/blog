document.addEventListener("turbolinks:load", function () {
  if (document.querySelector("nav.pagination .next a")) {
    var elem = document.querySelector('.posts');
    var infScroll = new InfiniteScroll(elem, {
      path: 'nav.pagination .next a',
      append: '.posts',
      checkLastPage: true,
      history: false,
      scrollThreshold: 10,
      loading: {
        msg: null,
        msgText: "<strong>次のページを読み込んでいます。</strong>"
      },
    });
  }

});

