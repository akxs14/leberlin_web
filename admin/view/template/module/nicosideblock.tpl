<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $section_config, $section_text, $font_awesome_icons, $nico_theme_positions, $opencart_version;
$autocomplete_products = $products;

$module_name = 'nicosideblock';
$section_text = 'side block';
$no_grid_layout = true;

$font_awesome_icons = array('' => '--- None ---', 'rub' => 'Rub','ruble' => 'Ruble','rouble' => 'Rouble','pagelines' => 'Pagelines','stack-exchange' => 'Stack exchange','arrow-circle-o-right' => 'Arrow circle-o-right','arrow-circle-o-left' => 'Arrow circle-o-left','caret-square-o-left' => 'Caret square-o-left','toggle-left' => 'Toggle left','dot-circle-o' => 'Dot circle-o','wheelchair' => 'Wheelchair','vimeo-square' => 'Vimeo square','try' => 'Try','turkish-lira' => 'Turkish lira','plus-square-o' => 'Plus square-o','adjust' => 'Adjust','anchor' => 'Anchor','archive' => 'Archive','arrows' => 'Arrows','arrows-h' => 'Arrows h','arrows-v' => 'Arrows v','asterisk' => 'Asterisk','ban' => 'Ban','bar-chart-o' => 'Bar chart-o','barcode' => 'Barcode','bars' => 'Bars','beer' => 'Beer','bell' => 'Bell','bell-o' => 'Bell o','bolt' => 'Bolt','book' => 'Book','bookmark' => 'Bookmark','bookmark-o' => 'Bookmark o','briefcase' => 'Briefcase','bug' => 'Bug','building-o' => 'Building o','bullhorn' => 'Bullhorn','bullseye' => 'Bullseye','calendar' => 'Calendar','calendar-o' => 'Calendar o','camera' => 'Camera','camera-retro' => 'Camera retro','caret-square-o-down' => 'Caret square-o-down','caret-square-o-left' => 'Caret square-o-left','caret-square-o-right' => 'Caret square-o-right','caret-square-o-up' => 'Caret square-o-up','certificate' => 'Certificate','check' => 'Check','check-circle' => 'Check circle','check-circle-o' => 'Check circle-o','check-square' => 'Check square','check-square-o' => 'Check square-o','circle' => 'Circle','circle-o' => 'Circle o','clock-o' => 'Clock o','cloud' => 'Cloud','cloud-download' => 'Cloud download','cloud-upload' => 'Cloud upload','code' => 'Code','code-fork' => 'Code fork','coffee' => 'Coffee','cog' => 'Cog','cogs' => 'Cogs','comment' => 'Comment','comment-o' => 'Comment o','comments' => 'Comments','comments-o' => 'Comments o','compass' => 'Compass','credit-card' => 'Credit card','crop' => 'Crop','crosshairs' => 'Crosshairs','cutlery' => 'Cutlery','dashboard' => 'Dashboard','desktop' => 'Desktop','dot-circle-o' => 'Dot circle-o','download' => 'Download','edit' => 'Edit','ellipsis-h' => 'Ellipsis h','ellipsis-v' => 'Ellipsis v','envelope' => 'Envelope','envelope-o' => 'Envelope o','eraser' => 'Eraser','exchange' => 'Exchange','exclamation' => 'Exclamation','exclamation-circle' => 'Exclamation circle','exclamation-triangle' => 'Exclamation triangle','external-link' => 'External link','external-link-square' => 'External link-square','eye' => 'Eye','eye-slash' => 'Eye slash','female' => 'Female','fighter-jet' => 'Fighter jet','film' => 'Film','filter' => 'Filter','fire' => 'Fire','fire-extinguisher' => 'Fire extinguisher','flag' => 'Flag','flag-checkered' => 'Flag checkered','flag-o' => 'Flag o','flash' => 'Flash','flask' => 'Flask','folder' => 'Folder','folder-o' => 'Folder o','folder-open' => 'Folder open','folder-open-o' => 'Folder open-o','frown-o' => 'Frown o','gamepad' => 'Gamepad','gavel' => 'Gavel','gear' => 'Gear','gears' => 'Gears','gift' => 'Gift','glass' => 'Glass','globe' => 'Globe','group' => 'Group','hdd-o' => 'Hdd o','headphones' => 'Headphones','heart' => 'Heart','heart-o' => 'Heart o','home' => 'Home','inbox' => 'Inbox','info' => 'Info','info-circle' => 'Info circle','key' => 'Key','keyboard-o' => 'Keyboard o','laptop' => 'Laptop','leaf' => 'Leaf','legal' => 'Legal','lemon-o' => 'Lemon o','level-down' => 'Level down','level-up' => 'Level up','lightbulb-o' => 'Lightbulb o','location-arrow' => 'Location arrow','lock' => 'Lock','magic' => 'Magic','magnet' => 'Magnet','mail-forward' => 'Mail forward','mail-reply' => 'Mail reply','mail-reply-all' => 'Mail reply-all','male' => 'Male','map-marker' => 'Map marker','meh-o' => 'Meh o','microphone' => 'Microphone','microphone-slash' => 'Microphone slash','minus' => 'Minus','minus-circle' => 'Minus circle','minus-square' => 'Minus square','minus-square-o' => 'Minus square-o','mobile' => 'Mobile','mobile-phone' => 'Mobile phone','money' => 'Money','moon-o' => 'Moon o','music' => 'Music','pencil' => 'Pencil','pencil-square' => 'Pencil square','pencil-square-o' => 'Pencil square-o','phone' => 'Phone','phone-square' => 'Phone square','picture-o' => 'Picture o','plane' => 'Plane','plus' => 'Plus','plus-circle' => 'Plus circle','plus-square' => 'Plus square','plus-square-o' => 'Plus square-o','power-off' => 'Power off','print' => 'Print','puzzle-piece' => 'Puzzle piece','qrcode' => 'Qrcode','question' => 'Question','question-circle' => 'Question circle','quote-left' => 'Quote left','quote-right' => 'Quote right','random' => 'Random','refresh' => 'Refresh','reply' => 'Reply','reply-all' => 'Reply all','retweet' => 'Retweet','road' => 'Road','rocket' => 'Rocket','rss' => 'Rss','rss-square' => 'Rss square','search' => 'Search','search-minus' => 'Search minus','search-plus' => 'Search plus','share' => 'Share','share-square' => 'Share square','share-square-o' => 'Share square-o','shield' => 'Shield','shopping-cart' => 'Shopping cart','sign-in' => 'Sign in','sign-out' => 'Sign out','signal' => 'Signal','sitemap' => 'Sitemap','smile-o' => 'Smile o','sort' => 'Sort','sort-alpha-asc' => 'Sort alpha-asc','sort-alpha-desc' => 'Sort alpha-desc','sort-amount-asc' => 'Sort amount-asc','sort-amount-desc' => 'Sort amount-desc','sort-asc' => 'Sort asc','sort-desc' => 'Sort desc','sort-down' => 'Sort down','sort-numeric-asc' => 'Sort numeric-asc','sort-numeric-desc' => 'Sort numeric-desc','sort-up' => 'Sort up','spinner' => 'Spinner','square' => 'Square','square-o' => 'Square o','star' => 'Star','star-half' => 'Star half','star-half-empty' => 'Star half-empty','star-half-full' => 'Star half-full','star-half-o' => 'Star half-o','star-o' => 'Star o','subscript' => 'Subscript','suitcase' => 'Suitcase','sun-o' => 'Sun o','superscript' => 'Superscript','tablet' => 'Tablet','tachometer' => 'Tachometer','tag' => 'Tag','tags' => 'Tags','tasks' => 'Tasks','terminal' => 'Terminal','thumb-tack' => 'Thumb tack','thumbs-down' => 'Thumbs down','thumbs-o-down' => 'Thumbs o-down','thumbs-o-up' => 'Thumbs o-up','thumbs-up' => 'Thumbs up','ticket' => 'Ticket','times' => 'Times','times-circle' => 'Times circle','times-circle-o' => 'Times circle-o','tint' => 'Tint','toggle-down' => 'Toggle down','toggle-left' => 'Toggle left','toggle-right' => 'Toggle right','toggle-up' => 'Toggle up','trash-o' => 'Trash o','trophy' => 'Trophy','truck' => 'Truck','umbrella' => 'Umbrella','unlock' => 'Unlock','unlock-alt' => 'Unlock alt','unsorted' => 'Unsorted','upload' => 'Upload','user' => 'User','users' => 'Users','video-camera' => 'Video camera','volume-down' => 'Volume down','volume-off' => 'Volume off','volume-up' => 'Volume up','warning' => 'Warning','wheelchair' => 'Wheelchair','wrench' => 'Wrench','check-square' => 'Check square','check-square-o' => 'Check square-o','circle' => 'Circle','circle-o' => 'Circle o','dot-circle-o' => 'Dot circle-o','minus-square' => 'Minus square','minus-square-o' => 'Minus square-o','plus-square' => 'Plus square','plus-square-o' => 'Plus square-o','square' => 'Square','square-o' => 'Square o','bitcoin' => 'Bitcoin','btc' => 'Btc','cny' => 'Cny','dollar' => 'Dollar','eur' => 'Eur','euro' => 'Euro','gbp' => 'Gbp','inr' => 'Inr','jpy' => 'Jpy','krw' => 'Krw','money' => 'Money','rmb' => 'Rmb','rouble' => 'Rouble','rub' => 'Rub','ruble' => 'Ruble','rupee' => 'Rupee','try' => 'Try','turkish-lira' => 'Turkish lira','usd' => 'Usd','won' => 'Won','yen' => 'Yen','align-center' => 'Align center','align-justify' => 'Align justify','align-left' => 'Align left','align-right' => 'Align right','bold' => 'Bold','chain' => 'Chain','chain-broken' => 'Chain broken','clipboard' => 'Clipboard','columns' => 'Columns','copy' => 'Copy','cut' => 'Cut','dedent' => 'Dedent','eraser' => 'Eraser','file' => 'File','file-o' => 'File o','file-text' => 'File text','file-text-o' => 'File text-o','files-o' => 'Files o','floppy-o' => 'Floppy o','font' => 'Font','indent' => 'Indent','italic' => 'Italic','link' => 'Link','list' => 'List','list-alt' => 'List alt','list-ol' => 'List ol','list-ul' => 'List ul','outdent' => 'Outdent','paperclip' => 'Paperclip','paste' => 'Paste','repeat' => 'Repeat','rotate-left' => 'Rotate left','rotate-right' => 'Rotate right','save' => 'Save','scissors' => 'Scissors','strikethrough' => 'Strikethrough','table' => 'Table','text-height' => 'Text height','text-width' => 'Text width','th' => 'Th','th-large' => 'Th large','th-list' => 'Th list','underline' => 'Underline','undo' => 'Undo','unlink' => 'Unlink','angle-double-down' => 'Angle double-down','angle-double-left' => 'Angle double-left','angle-double-right' => 'Angle double-right','angle-double-up' => 'Angle double-up','angle-down' => 'Angle down','angle-left' => 'Angle left','angle-right' => 'Angle right','angle-up' => 'Angle up','arrow-circle-down' => 'Arrow circle-down','arrow-circle-left' => 'Arrow circle-left','arrow-circle-o-down' => 'Arrow circle-o-down','arrow-circle-o-left' => 'Arrow circle-o-left','arrow-circle-o-right' => 'Arrow circle-o-right','arrow-circle-o-up' => 'Arrow circle-o-up','arrow-circle-right' => 'Arrow circle-right','arrow-circle-up' => 'Arrow circle-up','arrow-down' => 'Arrow down','arrow-left' => 'Arrow left','arrow-right' => 'Arrow right','arrow-up' => 'Arrow up','arrows' => 'Arrows','arrows-alt' => 'Arrows alt','arrows-h' => 'Arrows h','arrows-v' => 'Arrows v','caret-down' => 'Caret down','caret-left' => 'Caret left','caret-right' => 'Caret right','caret-square-o-down' => 'Caret square-o-down','caret-square-o-left' => 'Caret square-o-left','caret-square-o-right' => 'Caret square-o-right','caret-square-o-up' => 'Caret square-o-up','caret-up' => 'Caret up','chevron-circle-down' => 'Chevron circle-down','chevron-circle-left' => 'Chevron circle-left','chevron-circle-right' => 'Chevron circle-right','chevron-circle-up' => 'Chevron circle-up','chevron-down' => 'Chevron down','chevron-left' => 'Chevron left','chevron-right' => 'Chevron right','chevron-up' => 'Chevron up','hand-o-down' => 'Hand o-down','hand-o-left' => 'Hand o-left','hand-o-right' => 'Hand o-right','hand-o-up' => 'Hand o-up','long-arrow-down' => 'Long arrow-down','long-arrow-left' => 'Long arrow-left','long-arrow-right' => 'Long arrow-right','long-arrow-up' => 'Long arrow-up','toggle-down' => 'Toggle down','toggle-left' => 'Toggle left','toggle-right' => 'Toggle right','toggle-up' => 'Toggle up','arrows-alt' => 'Arrows alt','backward' => 'Backward','compress' => 'Compress','eject' => 'Eject','expand' => 'Expand','fast-backward' => 'Fast backward','fast-forward' => 'Fast forward','forward' => 'Forward','pause' => 'Pause','play' => 'Play','play-circle' => 'Play circle','play-circle-o' => 'Play circle-o','step-backward' => 'Step backward','step-forward' => 'Step forward','stop' => 'Stop','youtube-play' => 'Youtube play','adn' => 'Adn','android' => 'Android','apple' => 'Apple','bitbucket' => 'Bitbucket','bitbucket-square' => 'Bitbucket square','bitcoin' => 'Bitcoin','btc' => 'Btc','css3' => 'Css3','dribbble' => 'Dribbble','dropbox' => 'Dropbox','facebook' => 'Facebook','facebook-square' => 'Facebook square','flickr' => 'Flickr','foursquare' => 'Foursquare','github' => 'Github','github-alt' => 'Github alt','github-square' => 'Github square','gittip' => 'Gittip','google-plus' => 'Google plus','google-plus-square' => 'Google plus-square','html5' => 'Html5','instagram' => 'Instagram','linkedin' => 'Linkedin','linkedin-square' => 'Linkedin square','linux' => 'Linux','maxcdn' => 'Maxcdn','pagelines' => 'Pagelines','pinterest' => 'Pinterest','pinterest-square' => 'Pinterest square','renren' => 'Renren','skype' => 'Skype','stack-exchange' => 'Stack exchange','stack-overflow' => 'Stack overflow','trello' => 'Trello','tumblr' => 'Tumblr','tumblr-square' => 'Tumblr square','twitter' => 'Twitter','twitter-square' => 'Twitter square','vimeo-square' => 'Vimeo square','vk' => 'Vk','weibo' => 'Weibo','windows' => 'Windows','xing' => 'Xing','xing-square' => 'Xing square','youtube' => 'Youtube','youtube-play' => 'Youtube play','youtube-square' => 'Youtube square','ambulance' => 'Ambulance','h-square' => 'H square','hospital-o' => 'Hospital o','medkit' => 'Medkit','plus-square' => 'Plus square','stethoscope' => 'Stethoscope','user-md' => 'User md','wheelchair' => 'Wheelchair');


$module_config = array(
/*	'screen_position'=>array('select', 
					array('left' => 'Left',
						  'right' => 'Right',
						  ),
					'Screen position'
				),*/
	'screen_position'=>array('hidden',null,'Screen position', 'right', 20),
	'section' => array('section'),
);

$section_config = array(
	'icon'=>array('select', $font_awesome_icons, 'Icon (<a target="blank" href="http://fontawesome.io/icons/">reference</a>)'),
	'icon_text'=>array('multilanguage',null, 'Title'),
	'background'=>array('colorpicker',null, 'Background','',15),
	'color'=>array('colorpicker',null, 'Text color','', 15),
	'width'=>array('input',null,'Icon width', '35', 10),
	'height'=>array('input',null,'Icon height', '40', 10),
	'content_width'=>array('input',null,'Content width', '300', 10),
	'content_height'=>array('input',null,'Content height', '300', 10),


	'section_type'=>array('select', 
					array('youtube' => 'Youtube',
						  'vimeo' => 'Vimeo',
						  'facebook' => 'Facebook',
						  'twitter' => 'Twitter',
						  'image' => 'Image',
						  'product' => 'Product',
						  'text' => 'Text',
						  ),
					'Block type'
				),

	'facebook_section'=>array('section_type'),
	'facebook_id'=>array('input',null,'Facebook id', '', 20),

	'twitter_section'=>array('section_type'),
	'twitter_id'=>array('input',null,'Twitter id', '', 20),
	
	'youtube_section'=>array('section_type'),
	'youtube_id'=>array('input',null,'Video id', '', 20),

	'vimeo_section'=>array('section_type'),
	'vimeo_id'=>array('input',null,'Video id', '', 20),
/*
	'image_section'=>array('section_type'),
	'image'=>array('image',null, 'Image'),

	'product_section'=>array('section_type'),
	'product_list'=>array('autocomplete',null,'Product'),*/

	'text_section'=>array('section_type'),
	'text'=>array('multilanguage_html',null,'Text', '', 20),
);				

if ($opencart_version >= 2010) 
{
	require('nicomodule2010.tpl');
} else
if ($opencart_version >= 2000) 
{
	require('nicomodule2.tpl');
} else
{
	require('nicomodule.tpl');
}
