import 'dart:async';
import 'package:angular2/di.dart';
import 'package:angular2/angular2.dart';
import 'model/tree_model.dart';

@Injectable()
class MaterialTreeService implements OnInit{

	StreamController<TreeNode> __nodeController = new StreamController<TreeNode>();
	getNodeController(){
		return __nodeController;
	}





  @override
  ngOnInit() {

		// TODO: implement ngOnInit
  }
}