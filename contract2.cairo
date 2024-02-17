#[Starknet::contract]
mod MyToken {
    use starknet::ContractAddress;
    use openzeppelin::token::erc20::ERC20;

    #[storage]
    struct Storage {}

    #[constructor]
    fn constructor(self: @ContractState) {
        ERC20::InternalImpl::initializer(
            ERC20::unsafe_new_contract_state(),
            'MyToken',
            'MTK'
        );
    }

    #[external(v0)]
    fn mint(
        self: @ContractState,
        recipient: ContractAddress,
        amount: u256
    ) {
        ERC20::InternalImpl::_mint(
            ERC20::unsafe_new_contract_state(),
            recipient,
            amount
        );
    }
}
