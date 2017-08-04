import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_icons.dart';
import '../material_tree_service.dart';
import '../model/tree_model.dart';

@Component(
	selector: 'tree-node',
	styleUrls: const ['material_tree_node.css'],
	templateUrl: 'material_tree_node.html',
	directives: const [materialDirectives, COMMON_DIRECTIVES,TreeNodeComponent],
)
class TreeNodeComponent implements OnInit{

	MaterialTreeService _materialTreeService;
	TreeNodeComponent(this._materialTreeService);

	@Input('node')
	TreeNode node;



	selectNode(TreeNode n ){
		node.showChildren = !node.showChildren;
		_materialTreeService.getNodeController().add(n);
		print("selectnode called ");

	}
  @override
  ngOnInit() {
    // TODO: implement ngOnInit

  }
}
