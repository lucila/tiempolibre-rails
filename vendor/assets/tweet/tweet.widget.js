function AddTweet(TU,NP){
	new TWTR.Widget({
	  version: 2,
	  type: 'profile',
	  rpp: NP,
	  interval: 30000,
	  width: 'auto',
	  height: 'auto',
	  theme: {
		shell: {
		  background: 'none'
		},
		tweets: {
		  background: 'none'
		}
	  },
	  features: {
		scrollbar: false,
		loop: false,
		live: false,
		behavior: 'all'
	  },
	  ready: function() {
	  	setTimeout(init_sticky_footer, 1000);
	  }
	}).render().setUser(TU).start();
}