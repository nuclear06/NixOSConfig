{
  programs.ssh = {
    enable = true;
    # extraConfig = ''
    #   Host github.com
    #     Hostname ssh.github.com
    #     Port 443
    # '';
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
      };
    };
  };
}
