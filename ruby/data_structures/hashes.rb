# Example Exercise: Build the structure

example =	{
				:appetizers => [
    								0,
    								1,
    								{
    									:ingredients =>	[
    														0, 
    														{
    															:name => "I DID IT!" 
															} 
														]
									}
  								]
			}

p example[:appetizers][2][:ingredients][1][:name]

# Different Hash Syntaxes
{ "ingredients" => "stuff" }
{ ingredients: "stuff" }

arr = 	[
			[
				0,
				1,
				2,
				3,
				4,
				{
					:secret => {
									:unlock => [
													0,
													"I DID IT AGAIN!!"
												]
								}
				}
			]
		]

p arr[0][5][:secret][:unlock][1]

