# 1) takes in cli args, and..
#   hash::
#       { accessor_name_to_assign=>cli_arg_associated_with,
#           ...
#       }
#   
# 2) iterates through hash. Each cli_arg_passed_in matching an item in cli args array
#    has its accessor assigned to true
#    
# 3) later, asking for the specific cli arg by name will return whether the param was given

accepted_args = {
    :aloha=>"hello",
    :ghost=>"boo"
}

#
# Create accessor for whatever class this is mixed into
#
module DynamicAccessors
    # type accepts "full", "read", and "write"
    def create_accessor(accessor_name, value = "", type="full")
        instance_variable_set("@#{accessor_name}", value)
        self.class.send(:attr_accessor, accessor_name) if (type == "full") 
        self.class.send(:attr_reader, accessor_name) if (type == "read") 
        self.class.send(:attr_writer, accessor_name) if (type == "write") 
    end
end

# 
# CLASSES
#

# Create a handler for cli flags
#
# params_from_cli takes in ARGV, accepted_args takes in a config hash with params in this format:
#   accessor_name=>cli_param
#   
# Accessors are created for each accessor_name. Values are assigned to the accessors by
# searching through params_from_cli for the string in cli_param, where:
# If a cli_param matches an params_from_cli (ARGV) item, if there's an '=' in the params_from_cli 
#   item, the right side of the = is assigned as the value of the accessor of accessor_name. 
# If there is a match but no =, the accessor's value becomes (Boolean) true. 
# If there is no match, accessor value is (Boolean) false
# 
# Any "--" before a param passed in from the cli gets ignored
# 
class ParsedArguments
    include DynamicAccessors

    def initialize(params_from_cli, accepted_args)
        @accepted_args = accepted_args
        @params_from_cli = params_from_cli
        parse_cli_params
    end

    private
    def parse_cli_params
        @accepted_args.each {|accessor_name, cli_arg_string|
            cli_param_val = @params_from_cli.find {|cli_param_received|
                (/^(--)?#{cli_arg_string}(=.*)?$/.match(cli_param_received))
            }
            if !!cli_param_val
                cli_param_val = (cli_param_val.include? "=") ? 
                                cli_param_val.split('=')[1] : true
            else
                cli_param_val = false
            end
            create_accessor(accessor_name, cli_param_val)
        }
    end
end

# ensure it works
if __FILE__ == $0
    arg_handler = ParsedArguments.new(ARGV, accepted_args)
    puts arg_handler.aloha
    puts arg_handler.ghost
    arg_handler.ghost = "gr arg"
    puts arg_handler.ghost
end