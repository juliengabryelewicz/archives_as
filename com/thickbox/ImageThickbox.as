package com.thickbox{
	
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.external.ExternalInterface;
	
	//classe qui crée une image qui, en cliquant dessus, mène à un fenêtre thickbox
	public class ImageThickbox extends MovieClip{
		
		private var val_y:int;
		private var val_lienImage:String;
		private var val_lien:String;
		private var val_x:int;
	
		public function ImageThickbox(lienImage:String, position_y:int, position_x:int, lien:String):void{
		
			this.val_y=position_y;
			this.val_x=position_x;
			this.val_lien=lien;
			this.val_lienImage=lienImage;
			
			var contenant:MovieClip=new MovieClip();

	   		var chargeur:Loader = new Loader();
	   		var adresseImage:URLRequest = new URLRequest(val_lienImage);
	   		chargeur.load(adresseImage);
	   		contenant.addChild(chargeur);
			addChild(contenant);
			contenant.x=this.val_x;
			contenant.y=this.val_y;
			
			this.addEventListener(MouseEvent.CLICK, voirThickbox);
		}
		//on ouvre la fenêtre thickbox avec ExternalInterface qui active la fonction javascript tb_show()
		private function voirThickbox(evt:MouseEvent):void{
			ExternalInterface.call('tb_show' , null , this.val_lien, false);
		}
	}
}