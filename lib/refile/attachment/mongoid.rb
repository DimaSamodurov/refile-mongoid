module Refile
  module Mongoid
    module Attachment
      include Refile::Attachment

      # Attachment method which hooks into Mongoid models
      #
      # @see Refile::Attachment#attachment
      def attachment(name, raise_errors: false, **options)
        super

        field :"#{name}_id", type: String

        attacher = :"#{name}_attacher"

        validate do
          if send(attacher).present?
            send(attacher).valid?
            errors = send(attacher).errors
            errors.each do |error|
              self.errors.add(name, error)
            end
          end
        end

        before_save do
          send(attacher).store!
        end

        after_destroy do
          send(attacher).delete!
        end
      end
    end
  end
end

::Mongoid::Document::ClassMethods.send :include, Refile::Mongoid::Attachment




