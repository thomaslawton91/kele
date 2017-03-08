module Submissions
  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
    result = self.class.post(bloc_api("checkpoints_submissions"), body: {"checkpoint_id": checkpoint_id, "assignment_branch": assignment_branch, "assignment_commit_link": assignment_commit_link, "comment": comment }, headers: {"authorization" => @auth_token} )

    puts result
  end
end
