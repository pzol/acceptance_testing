module Role
  module TransactionsBrowser

    module Row
      def row(i)
        self.find("td[#{i}]").text
      end

      def timestamp;  DateTime.parse(row(1)); end
      def contract;   row(2); end
      def facility;   row(3); end
      def method;     row(4); end
      def time_taken; row(5).to_i; end
      def product;    row(6); end
    end

    def visit_latest_transactions
      visit '/'
    end

    def table_rows
      page.all('#transactionsTable tbody tr').map {|tr| tr.extend(Row) }
    end

    def sees_transactions_table!
      headers = %w[timestamp contract facility method time_taken product]
      begin 
        thead = find('#transactionsTable thead') 
      rescue Capybara::ElementNotFound
        raise("Could not find the transactionsTable in #{find('#summary').text}")
      end

      headers.each { |h| thead.should have_content h }
      page.should have_selector '#searchButton'
    end

    def all_table_rows
      table_rows.each { |tr| yield(tr) }
    end
    
  end
end
