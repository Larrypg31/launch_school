


# Example 3
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end


{Line: 1, Action: method call (map) , Object: The outer array,  Side Effect: None ,	Return Value: New array [1,3] , Is Return Value Used?: no }


{
  {Line: 1-4},
  {Action: block execution},
  {Object:Each sub-array},
  {Side Effect: none},
  {Return Value: integer at each index 0 of sub array},
  {Is Return Value Used?: "yes, used to transform the array and return a new array},
}

{
  {Line:2},
  {Action: method call puts},
  {Object:Integer at index of 0 of each sub-array},
  {Side Effect:outputs the integer selected by first},
  {Return Value: nil},
  {Is Return Value Used?: no]
 }

 {
   {Line:2},
   {Action: method call first},
   {Object:first index in sub array arr[0]},
   {Side Effect:none},
   {Return Value: Element at index 0 of sub-array},
   {Is Return Value Used?: yes, by puts}
  }


 {
   {Line:3},
   {Action: method call},
   {Object:first index of each sub-array},
   {Side Effect:none}
   {Return Value:first index of each sub-array },
   {Is Return Value Used?: yes, used for the values of the block}
  }










# Example 4
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

},




 {
   {Line:1},
   {Action: assign variable},   {Object: none},
   {Side Effect:none},
   {Return Value: the array [[18, 7], [3, 12]]  },
   {Is Return Value Used?: no}
  }

  {
    {Line:1},
    {Action: method each},
    {Object: outer array},
    {Side Effect:none},
    {Return Value: the array [[18, 7], [3, 12]]  },
    {Is Return Value Used?: assigns the outer array to the variable }
   }

   {
     {Line:1-7},
     {Action: block execution},
     {Object: outer array},
     {Side Effect:none}
     {Return Value: the array [[18, 7], [3, 12]]  },
     {Is Return Value Used?: assigns the outer array to the variable}
    }

    {
      {Line:2},
      {Action: method each},
      {Object: each item in sub-array},
      {Side Effect:none},
      {Return Value: original sub-array  },
      {Is Return Value Used?:no}
     }
     {Line:2-6},
     {Action: inner block},
     {Object: each element in sub-array},
     {Side Effect:none},
     {Return Value: nil },
     {Is Return Value Used?:no}
    }


     {Line:3},
     {Action: conditional if },
     {Object: evaluates the element passed within the sub-array for that iteration},
     {Side Effect:none},
     {Return Value: nil},
     {Is Return Value Used?:yes, checks to see if it is true or false}
    }

    {
    {Line:4},
    {Action: method call puts},
    {Object: variable num or the object of sub-array passed via iteration},
    {Side Effect: outputs a string},
    {Return Value: nil },
    {Is Return Value Used?:yes, used to determine return value of inner block}
   }


# Example 5


{
  {Line:1},
  {Action: Method call (map)},
  {Object: Original array },
  {Side Effect: no},
  {Return Value: new array, transformed },
  {Is Return Value Used?: no}
 }

 {
   {Line:1-5},
   {Action: outer Block},
   {Object: Original array },
   {Side Effect: no},
   {Return Value: new array, transformed },
   {Is Return Value Used?: yes, used by top-level map for transformation}
  }
  {
    {Line:2},
    {Action: Method call (map)},
    {Object: each sub array },
    {Side Effect: no},
    {Return Value: new sub array, transformed },
    {Is Return Value Used?: yes used to determine outer blocks return value}
   }
   {
     {Line:2-4},
     {Action:inner block},
     {Object: each sub array },
     {Side Effect: no},
     {Return Value: each element of the sub array * 2 (integer)},
     {Is Return Value Used?: yes used to create the transformed array my inner map method}
    }

    {
      {Line:3},
      {Action: multiplication },
      {Object: current iteration of the sub array * 2  },
      {Side Effect: no},
      {Return Value:(integer)},
      {Is Return Value Used?: yes used by inner map for return value}
     }



# 6

This code is selecting and returning all instances of the hashes inside the code that match the inner block.  The first line of the inner block is using the method all? to evaluate if all keys within the hash match a specific value.  The 3rd line within the code is evaluating if the keys in each hash match the first letter of their value and returning that key value pair. This line is using key.to_s and value[0] to check the match.  since the inner block is using the method all every key must match the first letter of the value within the hash to be returned.

If we were to use the method any? this method would return a new array with all of the same values.




# 9

Line 1 is calling the map method on a triple nested array. The map function is going to return an array from the results of the inner block.  The next line is calling the each method on each 2nd array, Each will return the original array and the return value will not be used. The 3rd line is calling the partition method to return 2 arrays for each element .  the forth line is the conditional in which the partition method will return the arrays based on.  This code does nothing to the code provided because all elements sizes are > 0.  

#10


{
  {Line:1},
  {Action: method call map },
  {Object: multidimensional array (outer most array)},
  {Side Effect: no},
  {Return Value:(none)},
  {Is Return Value Used?: no}
 }

 {
   {Line:1 - 11},
   {Action: block},
   {Object: multidimensional array (outer most array)},
   {Side Effect: no},
   {Return Value:new array based on conditions within the block},
   {Is Return Value Used?: no}
  }
  {
    {Line:2},
    {Action: method call map },
    {Object:on sub-array of the outer array},
    {Side Effect: no},
    {Return Value: new array based on conditions within the block},
    {Is Return Value Used?: yes by top level map method for return value}
   }
   {
     {Line:2 - 10 },
     {Action: block },
     {Object:on sub-array of the outer array},
     {Side Effect: no},
     {Return Value: new sub array based on conditions within the block},
     {Is Return Value Used?: yes by top level map method for return value}
    }

    {
      {Line:3},
      {Action: if condition based on each element of the sub-array },
      {Object:on sub-array of the first sub-array},
      {Side Effect: no},
      {Return Value: boolean},
      {Is Return Value Used?: Yes to check to see if the value is true or false}
     }

     {
       {Line:3-8},
       {Action: conditional block},
       {Object:on sub-array of the first sub-array},
       {Side Effect: yes if it is an integer it adds 1 to the element or if its an array it adds 1 to each element within the array},
       {Return Value: no },
       {Is Return Value Used?: no}
      }
      {
        {Line:4},
        {Action: adds 1 to the element},
        {Object:element of the sub-array},
        {Side Effect: no},
        {Return Value: element +1},
        {Is Return Value Used?: yes by the block to return a new integer to map}
       }
       {
         {Line:5},
         {Action: else condition based on each element of the sub-array },
         {Object:on sub-array of the first sub-array},
         {Side Effect: no},
         {Return Value: boolean},
         {Is Return Value Used?: no}
        }

        {
          {Line:5 - 9},
          {Action: else conditional if the first conditional is false},
          {Object:on each sub-array of the first sub-array},
          {Side Effect: no},
          {Return Value: boolean},
          {Is Return Value Used?: no}
         }

         {
           {Line:6},
           {Action: method call map},
           {Object:on element of the sub array},
           {Side Effect: no},
           {Return Value: new array},
           {Is Return Value Used?: yes by the map object above it in hierarchy for return value}
          }


          {Line:6 - 8},
          {Action: block},
          {Object:on each sub-array of the sub-array},
          {Side Effect: no},
          {Return Value: new array},
          {Is Return Value Used?: yes by the map object above it in hierarchy for return value}
         }

         {Line:7},
         {Action: adds 1 to each element within the passed array},
         {Object:on each iteration of sub-array of the sub-array},
         {Side Effect: no},
         {Return Value: the element + 1 integer},
         {Is Return Value Used?: yes by the map object above it in hierarchy for return value}
        }
