class TreeNode{
	String name ;
	bool isRoot;
	bool showChildren;
	List<TreeNode> children;
	bool isSelected ;
	bool isIndeterminate;



	TreeNode(String name , List<dynamic> children) {
		this.name = name;
		this.children = new List<TreeNode>();
		this.showChildren = false;
		this.isRoot = false;
		this.isSelected = false ;
		this.isIndeterminate = false ;
		if (children != null) {
			for (var node in children) {
				TreeNode t = new TreeNode(node.name, node.children);
				this.children.add(t);
			}
		}
	}
		List<TreeNode> getChildren(){
			return children;
		}

	bool isLeafNode(){
		return  children.length == 0 ;
	}
}


