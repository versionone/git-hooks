class GitCommit
  ASSET_FORMAT = /[a-z]{1,3}-\d{5,}/i
  attr_reader :message, :extra_comments

  def initialize(file = ARGV[0])
    @message_file = file
    parse_message
  end

  def asset_for_branch
    @asset ||= branch[ASSET_FORMAT]
  end

  def references?(asset)
    message.include? asset
  end

  private

    def branch
      `git symbolic-ref HEAD`[/refs\/heads\/(.+)/, 1]
    end

    def read_lines(file)
      File.readlines(file)
    end

    def parse_message
      lines = read_lines(@message_file)
      real_message = extract_message(lines)
      @extra_comments = lines.slice(real_message.length..-1).join
      @message = real_message.join
    end

    def extract_message(all_lines)
      all_lines.take_while { |line| !line.start_with?("#") }
    end
end
