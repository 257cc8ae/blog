var elem = document.querySelector('.posts');
var infScroll = new InfiniteScroll( elem, {
  path: 'nav.pagination .next a',
  append: '.posts',
  history: false,
});
