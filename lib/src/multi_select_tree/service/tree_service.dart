import 'dart:async';
import 'package:angular2/angular2.dart';
import '../model/multi_select_tree_model.dart';

@Injectable()
class TreeService implements OnInit{


	StreamController<List<MultiSelectTreeNode>> streamController = new StreamController<List<MultiSelectTreeNode>>();


	List<MultiSelectTreeNode> _selectedNodes = new List<MultiSelectTreeNode>() ;

	List<MultiSelectTreeNode> getSelectedNodes(){
		return _selectedNodes;
	}

  @override
  ngOnInit() {
    // TODO: implement ngOnInit
  }
}