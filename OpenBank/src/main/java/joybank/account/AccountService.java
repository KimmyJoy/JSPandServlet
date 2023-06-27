package joybank.account;

public class AccountService {

    private static AccountService instance = null;
    private AccountDAO accountDAO;

    private AccountService() {
        accountDAO = new AccountDAO();
    }

    public static AccountService getInstance() {
        if (instance == null) {
            instance = new AccountService();
        }
        return instance;
    }
}


