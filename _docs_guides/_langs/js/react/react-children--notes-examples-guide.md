Example 1: only render children of type span or type MyComponent
================================================================

    var ShowOnlySpansOrMyComponent = React.createClass({
        render: function() {
            var onlySpans = React.Children.map(this.props.children, function(child) {
                if (child.type === 'span' || child.type === MyComponent.type) {
                    return child;
                }
            });
            return <div>{ onlySpans }</div>;
        }
    });
