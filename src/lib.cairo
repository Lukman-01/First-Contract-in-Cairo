#[starknet::interface]
trait IAreaOfShapes<TContractState> {
    fn AreaOfSquare(ref self:TContractState, length:u128) -> u128;
    fn AreaOfRectangle(ref self:TContractState, length:u128, breath:u128) -> u128;
    fn AreaOfTriangle(ref self:TContractState, base:u128, height:u128) -> u128;
}

#[starknet::contract]

mod AreaOfShapes{

use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};

    #[storage]
    struct Storage {
        areaSq : u128,
        areaRec : u128,
        areaTr : u128,

    }

    #[abi(embed_v0)]
    impl AreaOfShapes of super::IAreaOfShapes<ContractState> {
        fn AreaOfSquare(ref self: ContractState, length: u128) -> u128 {
            let area = length * length;
            self.areaSq.write(area);
            area 
        }

        fn AreaOfRectangle(ref self: ContractState, length:u128, breath:u128) -> u128 {
            let areaofrec = length * breath;
            self.areaRec.write(areaofrec);
            areaofrec
        }

        fn AreaOfTriangle(ref self: ContractState, base:u128, height:u128) -> u128 {
            let areaoftr = (base * height)/2;
            self.areaTr.write(areaoftr);
            areaoftr
        }
    }
}


