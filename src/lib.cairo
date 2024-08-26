#[starknet::interface]
trait IAreaOfShapes<TContractState> {
    fn AreaOfSquare(self:@TContractState, length:u128) -> u128;
    fn AreaOfRectangle(self:@TContractState, length:u128, breath:u128) -> u128;
    fn AreaOfTriangle(self:@TContractState, base:u128, height:u128) -> u128;
}

#[starknet::contract]

mod AreaOfShapes{

    #[storage]
    struct Storage {
        
    }

    #[abi(embed_v0)]
    impl AreaOfShapes of super::IAreaOfShapes<ContractState> {
        fn AreaOfSquare(self: @ContractState, length: u128) -> u128 {
            length * length
        }

        fn AreaOfRectangle(self: @ContractState, length:u128, breath:u128) -> u128 {
            length * breath
        }

        fn AreaOfTriangle(self: @ContractState, base:u128, height:u128) -> u128 {
            (base * height)/2
        }
    }
}


