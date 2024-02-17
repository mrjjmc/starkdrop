#[Starknet::contract]
mod MyToken {
    use starknet::ContractAddress;
    use openzeppelin::token::erc20::ERC20;

    #[storage]
    struct Storage {}

    #[constructor]
    fn constructor(
        self: @ContractState,
        initial_supply: u256,
        recipient: ContractAddress
    ) {
        ERC20::InternalImpl::initializer(
            ERC20::unsafe_new_contract_state(),
            'MyToken',
            'MTK'
        )._mint(recipient, initial_supply);
    }
}
