
function create(){

for(i in 0...preloadStuff.length){
	graphicCache.cache(Paths.image(preloadStuff[i]));
}
trace('created shit');

} 

var preloadStuff = [
	'stages/wireframe/Bars',
	'stages/wireframe/Furnace Center',
	'stages/wireframe/Furnace Left',
	'stages/wireframe/Furnace Right',
	'stages/wireframe/Plataform',
	'stages/wireframe/Red Background',
	'icons/animated/destriobf-wireframe',
	'icons/animated/furnace-wireframe',
	'game/transition'
	];



    
