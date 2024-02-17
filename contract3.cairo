#[Starknet::contract]
mod MyToken {
    use starknet::ContractAddress;
    use openzeppelin::access::ownable::Ownable;
    use openzeppelin::token::erc20::ERC20;

    #[storage]
    struct Storage {}

    #[constructor]
    fn constructor(self: @ContractState, owner: ContractAddress) {
        // Set contract owner
        Ownable::InternalImpl::initializer(
            Ownable::unsafe_new_contract_state(),
            owner
        );

        // Initialize ERC20
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
        // Set permissions with Ownable
        Ownable::InternalImpl::assert_only_owner(
            Ownable::unsafe_new_contract_state()
        );

        // Mint tokens if called by the contract owner
        ERC20::InternalImpl::_mint(
            ERC20::unsafe_new_contract_state(),
            recipient,
            amount
        );
    }
}
