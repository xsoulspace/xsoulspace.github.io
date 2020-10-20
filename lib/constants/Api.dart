class ApiGithub {
  static String unencodedPath = 'api.github.com';
  static String organizationAccount = 'xsoulspace';
  // https://docs.github.com/en/free-pro-team@latest/rest/reference/repos#list-organization-repositories
  static String repos = '$unencodedPath/orgs/$organizationAccount/repos/';
  // https://docs.github.com/en/free-pro-team@latest/rest/reference/orgs#list-organization-members
  static String members = '$unencodedPath/orgs/$organizationAccount/members/';
}
