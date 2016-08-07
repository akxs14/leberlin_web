/**
 * History.js jQuery Adapter
 * @author Benjamin Arthur Lupton <contact@balupton.com>
 * @copyright 2010-2011 Benjamin Arthur Lupton <contact@balupton.com>
 * @license New BSD License <http://creativecommons.org/licenses/BSD/>
 */

// Closure
(function(window,undefined){
	"use strict";

	// Localise Globals
	var
		History = window.History = window.History||{},
		jQuery = window.jQuery;

	// Check Existence
	if ( typeof History.Adapter !== 'undefined' ) {
		throw new Error('History.js Adapter has already been loaded...');
	}

	// Add the Adapter
	History.Adapter = {
		/**
		 * History.Adapter.bind(el,event,callback)
		 * @param {Element|string} el
		 * @param {string} event - custom and standard events
		 * @param {function} callback
		 * @return {void}
		 */
		bind: function(el,event,callback){
			jQuery(el).bind(event,callback);
		},

		/**
		 * History.Adapter.trigger(el,event)
		 * @param {Element|string} el
		 * @param {string} event - custom and standard events
		 * @param {Object=} extra - a object of extra event data (optional)
		 * @return {void}
		 */
		trigger: function(el,event,extra){
			jQuery(el).trigger(event,extra);
		},

		/**
		 * History.Adapter.extractEventData(key,event,extra)
		 * @param {string} key - key for the event data to extract
		 * @param {string} event - custom and standard events
		 * @param {Object=} extra - a object of extra event data (optional)
		 * @return {mixed}
		 */
		extractEventData: function(key,event,extra){
			// jQuery Native then jQuery Custom
			var result = (event && event.originalEvent && event.originalEvent[key]) || (extra && extra[key]) || undefined;

			// Return
			return result;
		},

		/**
		 * History.Adapter.onDomLoad(callback)
		 * @param {function} callback
		 * @return {void}
		 */
		onDomLoad: function(callback) {
			jQuery(callback);
		}
	};

	// Try and Initialise History
	if ( typeof History.init !== 'undefined' ) {
		History.init();
	}

})(window);



/* Modernizr 2.7.1 (Custom Build) | MIT & BSD
 * Build: http://modernizr.com/download/#-csstransforms3d-csstransitions-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-css_pointerevents-load
 */
;window.Modernizr=function(a,b,c){function z(a){j.cssText=a}function A(a,b){return z(m.join(a+";")+(b||""))}function B(a,b){return typeof a===b}function C(a,b){return!!~(""+a).indexOf(b)}function D(a,b){for(var d in a){var e=a[d];if(!C(e,"-")&&j[e]!==c)return b=="pfx"?e:!0}return!1}function E(a,b,d){for(var e in a){var f=b[a[e]];if(f!==c)return d===!1?a[e]:B(f,"function")?f.bind(d||b):f}return!1}function F(a,b,c){var d=a.charAt(0).toUpperCase()+a.slice(1),e=(a+" "+o.join(d+" ")+d).split(" ");return B(b,"string")||B(b,"undefined")?D(e,b):(e=(a+" "+p.join(d+" ")+d).split(" "),E(e,b,c))}var d="2.7.1",e={},f=!0,g=b.documentElement,h="modernizr",i=b.createElement(h),j=i.style,k,l={}.toString,m=" -webkit- -moz- -o- -ms- ".split(" "),n="Webkit Moz O ms",o=n.split(" "),p=n.toLowerCase().split(" "),q={},r={},s={},t=[],u=t.slice,v,w=function(a,c,d,e){var f,i,j,k,l=b.createElement("div"),m=b.body,n=m||b.createElement("body");if(parseInt(d,10))while(d--)j=b.createElement("div"),j.id=e?e[d]:h+(d+1),l.appendChild(j);return f=["&#173;",'<style id="s',h,'">',a,"</style>"].join(""),l.id=h,(m?l:n).innerHTML+=f,n.appendChild(l),m||(n.style.background="",n.style.overflow="hidden",k=g.style.overflow,g.style.overflow="hidden",g.appendChild(n)),i=c(l,a),m?l.parentNode.removeChild(l):(n.parentNode.removeChild(n),g.style.overflow=k),!!i},x={}.hasOwnProperty,y;!B(x,"undefined")&&!B(x.call,"undefined")?y=function(a,b){return x.call(a,b)}:y=function(a,b){return b in a&&B(a.constructor.prototype[b],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(b){var c=this;if(typeof c!="function")throw new TypeError;var d=u.call(arguments,1),e=function(){if(this instanceof e){var a=function(){};a.prototype=c.prototype;var f=new a,g=c.apply(f,d.concat(u.call(arguments)));return Object(g)===g?g:f}return c.apply(b,d.concat(u.call(arguments)))};return e}),q.csstransforms3d=function(){var a=!!F("perspective");return a&&"webkitPerspective"in g.style&&w("@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}",function(b,c){a=b.offsetLeft===9&&b.offsetHeight===3}),a},q.csstransitions=function(){return F("transition")};for(var G in q)y(q,G)&&(v=G.toLowerCase(),e[v]=q[G](),t.push((e[v]?"":"no-")+v));return e.addTest=function(a,b){if(typeof a=="object")for(var d in a)y(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return e;b=typeof b=="function"?b():b,typeof f!="undefined"&&f&&(g.className+=" "+(b?"":"no-")+a),e[a]=b}return e},z(""),i=k=null,function(a,b){function l(a,b){var c=a.createElement("p"),d=a.getElementsByTagName("head")[0]||a.documentElement;return c.innerHTML="x<style>"+b+"</style>",d.insertBefore(c.lastChild,d.firstChild)}function m(){var a=s.elements;return typeof a=="string"?a.split(" "):a}function n(a){var b=j[a[h]];return b||(b={},i++,a[h]=i,j[i]=b),b}function o(a,c,d){c||(c=b);if(k)return c.createElement(a);d||(d=n(c));var g;return d.cache[a]?g=d.cache[a].cloneNode():f.test(a)?g=(d.cache[a]=d.createElem(a)).cloneNode():g=d.createElem(a),g.canHaveChildren&&!e.test(a)&&!g.tagUrn?d.frag.appendChild(g):g}function p(a,c){a||(a=b);if(k)return a.createDocumentFragment();c=c||n(a);var d=c.frag.cloneNode(),e=0,f=m(),g=f.length;for(;e<g;e++)d.createElement(f[e]);return d}function q(a,b){b.cache||(b.cache={},b.createElem=a.createElement,b.createFrag=a.createDocumentFragment,b.frag=b.createFrag()),a.createElement=function(c){return s.shivMethods?o(c,a,b):b.createElem(c)},a.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+m().join().replace(/[\w\-]+/g,function(a){return b.createElem(a),b.frag.createElement(a),'c("'+a+'")'})+");return n}")(s,b.frag)}function r(a){a||(a=b);var c=n(a);return s.shivCSS&&!g&&!c.hasCSS&&(c.hasCSS=!!l(a,"article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}")),k||q(a,c),a}var c="3.7.0",d=a.html5||{},e=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,f=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,g,h="_html5shiv",i=0,j={},k;(function(){try{var a=b.createElement("a");a.innerHTML="<xyz></xyz>",g="hidden"in a,k=a.childNodes.length==1||function(){b.createElement("a");var a=b.createDocumentFragment();return typeof a.cloneNode=="undefined"||typeof a.createDocumentFragment=="undefined"||typeof a.createElement=="undefined"}()}catch(c){g=!0,k=!0}})();var s={elements:d.elements||"abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output progress section summary template time video",version:c,shivCSS:d.shivCSS!==!1,supportsUnknownElements:k,shivMethods:d.shivMethods!==!1,type:"default",shivDocument:r,createElement:o,createDocumentFragment:p};a.html5=s,r(b)}(this,b),e._version=d,e._prefixes=m,e._domPrefixes=p,e._cssomPrefixes=o,e.testProp=function(a){return D([a])},e.testAllProps=F,e.testStyles=w,e.prefixed=function(a,b,c){return b?F(a,b,c):F(a,"pfx")},g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(f?" js "+t.join(" "):""),e}(this,this.document),function(a,b,c){function d(a){return"[object Function]"==o.call(a)}function e(a){return"string"==typeof a}function f(){}function g(a){return!a||"loaded"==a||"complete"==a||"uninitialized"==a}function h(){var a=p.shift();q=1,a?a.t?m(function(){("c"==a.t?B.injectCss:B.injectJs)(a.s,0,a.a,a.x,a.e,1)},0):(a(),h()):q=0}function i(a,c,d,e,f,i,j){function k(b){if(!o&&g(l.readyState)&&(u.r=o=1,!q&&h(),l.onload=l.onreadystatechange=null,b)){"img"!=a&&m(function(){t.removeChild(l)},50);for(var d in y[c])y[c].hasOwnProperty(d)&&y[c][d].onload()}}var j=j||B.errorTimeout,l=b.createElement(a),o=0,r=0,u={t:d,s:c,e:f,a:i,x:j};1===y[c]&&(r=1,y[c]=[]),"object"==a?l.data=c:(l.src=c,l.type=a),l.width=l.height="0",l.onerror=l.onload=l.onreadystatechange=function(){k.call(this,r)},p.splice(e,0,u),"img"!=a&&(r||2===y[c]?(t.insertBefore(l,s?null:n),m(k,j)):y[c].push(l))}function j(a,b,c,d,f){return q=0,b=b||"j",e(a)?i("c"==b?v:u,a,b,this.i++,c,d,f):(p.splice(this.i++,0,a),1==p.length&&h()),this}function k(){var a=B;return a.loader={load:j,i:0},a}var l=b.documentElement,m=a.setTimeout,n=b.getElementsByTagName("script")[0],o={}.toString,p=[],q=0,r="MozAppearance"in l.style,s=r&&!!b.createRange().compareNode,t=s?l:n.parentNode,l=a.opera&&"[object Opera]"==o.call(a.opera),l=!!b.attachEvent&&!l,u=r?"object":l?"script":"img",v=l?"script":u,w=Array.isArray||function(a){return"[object Array]"==o.call(a)},x=[],y={},z={timeout:function(a,b){return b.length&&(a.timeout=b[0]),a}},A,B;B=function(a){function b(a){var a=a.split("!"),b=x.length,c=a.pop(),d=a.length,c={url:c,origUrl:c,prefixes:a},e,f,g;for(f=0;f<d;f++)g=a[f].split("="),(e=z[g.shift()])&&(c=e(c,g));for(f=0;f<b;f++)c=x[f](c);return c}function g(a,e,f,g,h){var i=b(a),j=i.autoCallback;i.url.split(".").pop().split("?").shift(),i.bypass||(e&&(e=d(e)?e:e[a]||e[g]||e[a.split("/").pop().split("?")[0]]),i.instead?i.instead(a,e,f,g,h):(y[i.url]?i.noexec=!0:y[i.url]=1,f.load(i.url,i.forceCSS||!i.forceJS&&"css"==i.url.split(".").pop().split("?").shift()?"c":c,i.noexec,i.attrs,i.timeout),(d(e)||d(j))&&f.load(function(){k(),e&&e(i.origUrl,h,g),j&&j(i.origUrl,h,g),y[i.url]=2})))}function h(a,b){function c(a,c){if(a){if(e(a))c||(j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}),g(a,j,b,0,h);else if(Object(a)===a)for(n in m=function(){var b=0,c;for(c in a)a.hasOwnProperty(c)&&b++;return b}(),a)a.hasOwnProperty(n)&&(!c&&!--m&&(d(j)?j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}:j[n]=function(a){return function(){var b=[].slice.call(arguments);a&&a.apply(this,b),l()}}(k[n])),g(a[n],j,b,n,h))}else!c&&l()}var h=!!a.test,i=a.load||a.both,j=a.callback||f,k=j,l=a.complete||f,m,n;c(h?a.yep:a.nope,!!i),i&&c(i)}var i,j,l=this.yepnope.loader;if(e(a))g(a,0,l,0);else if(w(a))for(i=0;i<a.length;i++)j=a[i],e(j)?g(j,0,l,0):w(j)?B(j):Object(j)===j&&h(j,l);else Object(a)===a&&h(a,l)},B.addPrefix=function(a,b){z[a]=b},B.addFilter=function(a){x.push(a)},B.errorTimeout=1e4,null==b.readyState&&b.addEventListener&&(b.readyState="loading",b.addEventListener("DOMContentLoaded",A=function(){b.removeEventListener("DOMContentLoaded",A,0),b.readyState="complete"},0)),a.yepnope=k(),a.yepnope.executeStack=h,a.yepnope.injectJs=function(a,c,d,e,i,j){var k=b.createElement("script"),l,o,e=e||B.errorTimeout;k.src=a;for(o in d)k.setAttribute(o,d[o]);c=j?h:c||f,k.onreadystatechange=k.onload=function(){!l&&g(k.readyState)&&(l=1,c(),k.onload=k.onreadystatechange=null)},m(function(){l||(l=1,c(1))},e),i?k.onload():n.parentNode.insertBefore(k,n)},a.yepnope.injectCss=function(a,c,d,e,g,i){var e=b.createElement("link"),j,c=i?h:c||f;e.href=a,e.rel="stylesheet",e.type="text/css";for(j in d)e.setAttribute(j,d[j]);g||(n.parentNode.insertBefore(e,n),m(c,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))},Modernizr.addTest("pointerevents",function(){var a=document.createElement("x"),b=document.documentElement,c=window.getComputedStyle,d;return"pointerEvents"in a.style?(a.style.pointerEvents="auto",a.style.pointerEvents="x",b.appendChild(a),d=c&&c(a,"").pointerEvents==="auto",b.removeChild(a),!!d):!1});
/*!
 * classie - class helper functions
 * from bonzo https://github.com/ded/bonzo
 * 
 * classie.has( elem, 'my-class' ) -> true/false
 * classie.add( elem, 'my-new-class' )
 * classie.remove( elem, 'my-unwanted-class' )
 * classie.toggle( elem, 'my-class' )
 */

/*jshint browser: true, strict: true, undef: true */
/*global define: false */

( function( window ) {

'use strict';

// class helper functions from bonzo https://github.com/ded/bonzo

function classReg( className ) {
  return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
}

// classList support for class management
// altho to be fair, the api sucks because it won't accept multiple classes at once
var hasClass, addClass, removeClass;

if ( 'classList' in document.documentElement ) {
  hasClass = function( elem, c ) {
    if (elem) return elem.classList.contains( c );
  };
  addClass = function( elem, c ) {
    if (elem) elem.classList.add( c );
  };
  removeClass = function( elem, c ) {
    if (elem)  elem.classList.remove( c );
  };
}
else {
  hasClass = function( elem, c ) {
    return classReg( c ).test( elem.className );
  };
  addClass = function( elem, c ) {
    if ( !hasClass( elem, c ) ) {
      elem.className = elem.className + ' ' + c;
    }
  };
  removeClass = function( elem, c ) {
    elem.className = elem.className.replace( classReg( c ), ' ' );
  };
}

function toggleClass( elem, c ) {
  var fn = hasClass( elem, c ) ? removeClass : addClass;
  fn( elem, c );
}

var classie = {
  // full names
  hasClass: hasClass,
  addClass: addClass,
  removeClass: removeClass,
  toggleClass: toggleClass,
  // short names
  has: hasClass,
  add: addClass,
  remove: removeClass,
  toggle: toggleClass
};

// transport
if ( typeof define === 'function' && define.amd ) {
  // AMD
  define( classie );
} else {
  // browser global
  window.classie = classie;
}

})( window );



var docElem = window.document.documentElement,
	transEndEventNames = {
		'WebkitTransition': 'webkitTransitionEnd',
		'MozTransition': 'transitionend',
		'OTransition': 'oTransitionEnd',
		'msTransition': 'MSTransitionEnd',
		'transition': 'transitionend'
	},
	transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
	support = {
		pointerevents : Modernizr.pointerevents,
		csstransitions : Modernizr.csstransitions,
		csstransforms3d : Modernizr.csstransforms3d
	};

function scrollX() {
	return window.pageXOffset || docElem.scrollLeft; 
}

function scrollY() {
	return window.pageYOffset || docElem.scrollTop;
}

// from http://responsejs.com/labs/dimensions/
function getViewportW() {
	var client = docElem['clientWidth'],
		inner = window['innerWidth'];
	
	if( client < inner )
		return inner;
	else
		return client;
}

function getViewportH() {
	var client = docElem['clientHeight'],
		inner = window['innerHeight'];
	
	if( client < inner )
		return inner;
	else
		return client;
}

function extend( a, b ) {
	for( var key in b ) { 
		if( b.hasOwnProperty( key ) ) {
			a[key] = b[key];
		}
	}
	return a;
}


/**
 * grid3d.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2014, Codrops
 * http://www.codrops.com
 */
;( function( window ) {
	
	'use strict';

	function grid3D( el, options ) {
		if (typeof el == 'undefined' ) return false;
		this.el = el;
		this.options = extend( {}, this.options );
  		extend( this.options, options );
  		this._init();
	}

	// any options you might want to configure
	grid3D.prototype.options = {};

	grid3D.prototype._init = function() {
		// grid wrapper
		this.gridWrap = this.el.querySelector( '#container div.grid_wrap' );
		// grid element
		this.grid = this.gridWrap.querySelector( 'div.row' );
		// main grid items
		this.gridItems = [].slice.call( this.grid.querySelectorAll( '.prod .product .image > a' ) );
		// default sizes for grid items
		//console.log(this.gridItems[0].parentNode.parentNode.parentNode.offsetHeight);
		this.itemSize = { width : this.gridItems[0].parentNode.parentNode.parentNode.offsetWidth, height : this.gridItems[0].parentNode.parentNode.parentNode.offsetHeight };
		// content
		this.contentEl = this.el.querySelector( 'div.content' );
		// content items
		//this.contentItems = [].slice.call( this.grid.querySelectorAll( '.prod')/*this.contentEl.children */);
		// close content cross
		this.close = this.contentEl.querySelector( 'span.close-content' );
		// loading indicator
		this.loader = this.contentEl.querySelector( 'span.loading' );
		// support: support for pointer events, transitions and 3d transforms
		this.support = support.pointerevents && support.csstransitions && support.csstransforms3d;
		// init events
		this._initEvents();
		
		this.itemIndex = 0;
	};

	grid3D.prototype._initEvents = function() {
		var self = this;
		
		// open the content element when clicking on the main grid items
		this.gridItems.forEach( function( item, idx ) {
			item.parentNode.addEventListener( 'click', function(e) {
				if (history.pushState) {last_url = window.location.href;history.pushState({}, null, item.href);}
				self._showContent( idx, item.href);
				e.preventDefault();
				return false;
			} );
		} );

		// close the content element
		this.close.addEventListener( 'click', function() {
			self._hideContent();
			if (history.pushState && last_url) {history.pushState({}, null, last_url);}
		} );

		if( this.support ) {
			// window resize
			window.addEventListener( 'resize', function() { self._resizeHandler(); } );

			// trick to prevent scrolling when animation is running (opening only)
			// this prevents that the back of the placeholder does not stay positioned in a wrong way
			window.addEventListener( 'scroll', function() {
				if ( self.isAnimating ) {
					window.scrollTo( self.scrollPosition ? self.scrollPosition.x : 0, self.scrollPosition ? self.scrollPosition.y : 0 );
				}
				else {
					self.scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
					// change the grid perspective origin as we scroll the page
					self._scrollHandler();
				}
			});
		}
	};

	// creates placeholder and animates it to fullscreen
	// in the end of the animation the content is shown
	// a loading indicator will appear for 1 second to simulate a loading period
	grid3D.prototype._showContent = function( pos, href ) {

		classie.addClass( document.body, 'noscroll' );

		if( this.isAnimating ) {
			return false;
		}
		this.isAnimating = true;

		var self = this,
			loadContent = function() {
				classie.addClass( self.contentEl, 'show' );

				$.ajax({
				  url: href + "&ajax=true",
				  context: document.body
				}).done(function(html) {
					jQuery(".content > div").scrollTop(0).html(html);
					classie.removeClass( self.loader, 'show' );
					self.isAnimating = false;
					
					//delay animation for chrome when no additional images are on product page
					setTimeout(function() 
					{
						jQuery(".content > div").addClass("show");
					}, 50);
					
					//load reviews
					$('#review').load('index.php?route=product/product/review&product_id=' + jQuery('input[name=\'product_id\']').val());

					// in the end of the transition set class "show" to respective content item
					//classie.addClass( self.contentItems[ pos ], 'show' );
					
					// in the end of the transition set class "show" to respective content item
					//classie.addClass( self.contentItems[ pos ], 'show' );
				});
				
				// simulating loading...
				/*setTimeout( function() {
					// hide loader
					classie.removeClass( self.loader, 'show' );
					// in the end of the transition set class "show" to respective content item
					classie.addClass( self.contentItems[ pos ], 'show' );
				}, 1000 );*/
				// show content area
			}				
			
		// if no support just load the content (simple fallback - no animation at all)
		if( !this.support ) {
			loadContent();
			return false;
		}

		classie.addClass( self.loader, 'show' );

		var currentItem = this.gridItems[ pos ],
			itemContent = currentItem.innerHTML;
		
		this.itemIndex = pos;
		
		// create the placeholder
		this.placeholder = this._createPlaceholder(itemContent );
		
		// set the top and left of the placeholder to the top and left of the clicked grid item (relative to the grid)
		this.placeholder.style.left = currentItem.parentNode.parentNode.parentNode.offsetLeft + 'px';
		this.placeholder.style.top = currentItem.parentNode.parentNode.parentNode.offsetTop + 'px';
/*		console.log(currentItem.parentNode.parentNode.parentNode);
		console.log(currentItem.parentNode.parentNode.parentNode.offsetTop + ' - ' + currentItem.parentNode.parentNode.parentNode.offsetLeft);
*/		
		// append placeholder to the grid
		this.grid.appendChild( this.placeholder );

		// and animate it
		var animFn = function() {
			// give class "active" to current grid item (hides it)
			classie.addClass( currentItem, 'active' );
			// add class "view-full" to the grid-wrap
			classie.addClass( self.gridWrap, 'view-full' );
			//classie.addClass( self.gridWrap, 'row' );
			// set width/height/left/top of placeholder
			self._resizePlaceholder();
			var onEndTransitionFn = function( ev ) {
				if( ev.propertyName.indexOf( 'transform' ) === -1 ) return false;
				this.removeEventListener( transEndEventName, onEndTransitionFn );
				loadContent();
			};
			self.placeholder.addEventListener( transEndEventName, onEndTransitionFn );
		};

		setTimeout( animFn, 25 );
	};

	grid3D.prototype._hideContent = function() {
		var self = this,
			contentItem = this.el.querySelector( 'div.content > .show' ),
			currentItem = this.gridItems[ this.itemIndex ].parentNode.parentNode.parentNode;
		
		classie.removeClass( contentItem, 'show' );
		classie.removeClass( this.contentEl, 'show' );
		// without the timeout there seems to be some problem in firefox
		setTimeout( function() { classie.removeClass( document.body, 'noscroll' ); }, 100 );
		// that's it for no support..
		if( !this.support ) return false;

		classie.removeClass( this.gridWrap, 'view-full' );

		// reset placeholder style values
		//var _currentItem = currentItem.parentNode.parentNode.parentNode;
		//console.log(currentItem);
		//console.log(this.itemSize);
		
		this.placeholder.style.left = currentItem.offsetLeft + 'px';
		this.placeholder.style.top = currentItem.offsetTop + 'px';
		this.placeholder.style.width = this.itemSize.width + 'px';
		this.placeholder.style.height = this.itemSize.height + 'px';

		var onEndPlaceholderTransFn = function( ev ) {
			this.removeEventListener( transEndEventName, onEndPlaceholderTransFn );
			// remove placeholder from grid
			self.placeholder.parentNode.removeChild( self.placeholder );
			// show grid item again
			classie.removeClass( currentItem, 'active' );
		};
		this.placeholder.addEventListener( transEndEventName, onEndPlaceholderTransFn );
	}

	// function to create the placeholder
	/*
	<div class="placeholder">
		<div class="front">[content]</div>
		<div class="back"></div>
	</div>
	*/
	grid3D.prototype._createPlaceholder = function( content ) {
		var front = document.createElement( 'div' );
		front.className = 'front';
		front.innerHTML = content;
		var back = document.createElement( 'div' );
		back.className = 'back';
		back.innerHTML = '&nbsp;';
		var placeholder = document.createElement( 'div' );
		placeholder.className = 'placeholder';
		placeholder.appendChild( front );
		placeholder.appendChild( back );
		return placeholder;
	};

	grid3D.prototype._scrollHandler = function() {
		var self = this;
		if( !this.didScroll ) {
			this.didScroll = true;
			setTimeout( function() { self._scrollPage(); }, 60 );
		}
	};

	// changes the grid perspective origin as we scroll the page
	grid3D.prototype._scrollPage = function() {
		var perspY = scrollY() + getViewportH() / 2;
		this.gridWrap.style.WebkitPerspectiveOrigin = '50% ' + perspY + 'px';
		this.gridWrap.style.MozPerspectiveOrigin = '50% ' + perspY + 'px';
		this.gridWrap.style.perspectiveOrigin = '50% ' + perspY + 'px';
		this.didScroll = false;
	};

	grid3D.prototype._resizeHandler = function() {
		var self = this;
		function delayed() {
			self._resizePlaceholder();
			self._scrollPage();
			self._resizeTimeout = null;
		}
		if ( this._resizeTimeout ) {
			clearTimeout( this._resizeTimeout );
		}
		this._resizeTimeout = setTimeout( delayed, 50 );
	}

	grid3D.prototype._resizePlaceholder = function() {
		// need to recalculate all these values as the size of the window changes
		this.itemSize = { width : this.gridItems[0].parentNode.parentNode.parentNode.offsetWidth, height : this.gridItems[0].parentNode.parentNode.parentNode.offsetHeight };
		if( this.placeholder ) {
			// set the placeholders top to "0 - grid offsetTop" and left to "0 - grid offsetLeft"
			this.placeholder.style.left = Number( -1 * ( this.grid.offsetLeft - scrollX() ) ) + 'px';
			this.placeholder.style.top = Number( -1 * ( this.grid.offsetTop - scrollY() ) ) + 'px';
			// set the placeholders width to windows width and height to windows height
			this.placeholder.style.width = getViewportW() + 'px';
			this.placeholder.style.height = getViewportH() + 'px';
		}
	}

	// add to global namespace
	window.grid3D = grid3D;

})( window );
