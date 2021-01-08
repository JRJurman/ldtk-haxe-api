/**
	This sample for Heaps.io engine demonstrates how to render all layers and all levels in the project world.
**/
class Heaps_World extends hxd.App {

	static function main() {
		// Boot
		new Heaps_World();
	}

	override function init() {
		super.init();

		// Init general heaps stuff
		hxd.Res.initEmbed();
		s2d.setScale( dn.heaps.Scaler.bestFit_i(650,256) ); // scale view to fit

		// Read project JSON
		var project = new _Project();

		// Render each level
		for( level in project.levels ) {
			// Create a wrapper to render all layers in it
			var levelWrapper = new h2d.Object( s2d );

			// Position accordingly to world pixel coords
			levelWrapper.x = level.worldX;
			levelWrapper.y = level.worldY;

			// Render background layer
			levelWrapper.addChild( level.l_Background.render() );

			// Render collision layer tiles
			levelWrapper.addChild( level.l_Collisions.render() );

			// Render custom tiles layer
			levelWrapper.addChild( level.l_Custom_tiles.render() );
		}

	}
}

