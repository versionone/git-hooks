module Gittr
  class Commit
    attr_reader :message, :extra_comments

    ASSET_FORMAT = /[a-z]{1,3}-\d{5,}/i

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

    def reference(asset)
      new_message = format_message(asset)
      write_message(new_message)
    end

    private

      def branch
        branch_path = `git symbolic-ref HEAD`
        branch_path[/refs\/heads\/(.+)/, 1] || ''
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

      def write_message(content)
        File.open(@message_file, 'w') { |f| f.write(content) }
        content
      end

      def format_message(asset)
        return <<-COMMIT_MSG
#{message.strip}

VersionOne: #{asset}
#{extra_comments.strip}
                  COMMIT_MSG
      end
  end

end
