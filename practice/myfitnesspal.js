// "path/to/this/./directory"  =>   "path/to/this/directory"
// "path/to/this/../directory"  =>   "path/to/directory"
// "./to/this/../directory"  =>   "/to/directory"
// "../to/this/../directory"  =>   "/to/directory"


class App extends React.Component {
	normalize(string) {
  	const stack = [];
    let startWithDot = false;
    
  	string.split('/').forEach( (string, index )=> {   
    
    	if ( (string === ".." || string === ".") && index == 0 ) {
        startWithDot = true;
      }
      
    	if (string === "..") {
      	if (stack[stack.length-1]) {
        	stack.pop(); 
        }
      } 
      else if (string == ".") {
      	continue;
      }
      else {
      	stack.push(string);
			}
    });
    
    if (startWithDot) {
      stack.unshift('/'); 
    }
    
		return stack.join('/');
  }
  
  render(){   
  	let string = "foo/./bar";
  	console.log(normalize(string));
  
    return (
      <div>
        <h1>Hello World</h1>
      </div>
        );
    }
}
 
ReactDOM.render(<App />, document.getElementById("app"));
